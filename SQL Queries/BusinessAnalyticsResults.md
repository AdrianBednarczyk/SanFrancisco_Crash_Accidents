/** Some fast cases to solved to show skills in SQL **/

/**1. Does seat belt use affect the number of road accident casualties? Analyze the data on casualties and determine whether seat belt 
use reduces the severity of accidents. For each safety equipment category, calculate:
- the number of people involved in accidents
- the total number of injuries
- the total number of fatalities
- the percentage of injuries
- the percentage of fatalities

Then compare the results between:
- the use of seat belts
- the lack of seat belt use
Finally, indicate in which cases the lack of seat belt use most increases the risk of death in an accident.**/

WITH Safety_Stats AS (SELECT
	COUNT(*) AS Participant,
    SUM(number_injured) AS Total_Injured,
    SUM(number_killed) AS Total_Killed,
    CONCAT(ROUND(SUM(number_injured)/NULLIF(COUNT(*),0)*100,2),'%') AS Injured_Ratio,
    CONCAT(ROUND(SUM(number_killed)/NULLIF(COUNT(*),0)*100,2),'%') AS Killed_Ratio,
	victim_safety_equip_1
    FROM dim_victims_final
	WHERE victim_safety_equip_1 = 'Lap/Shoulder Harness Not Used' OR victim_safety_equip_1 ='Lap/Shoulder Harness Used' 
    GROUP BY victim_safety_equip_1)

SELECT
MAX(CASE WHEN victim_safety_equip_1 = 'Lap/Shoulder Harness Not Used'
    THEN Killed_Ratio END) AS Not_UsedHarness_Ratio,
MAX(CASE WHEN victim_safety_equip_1 = 'Lap/Shoulder Harness Used'
    THEN Killed_Ratio END) AS Not_Used_Ratio
FROM Safety_Stats;

<img width="722" height="73" alt="Ekren screen " src="https://github.com/user-attachments/assets/b377c843-99e8-4e3e-9ef0-890816e61958" />

<img width="292" height="57" alt="image" src="https://github.com/user-attachments/assets/e15e0623-4319-4b74-9f1a-caafb6298205" />

/** 2. Which days of the week have the highest number of accidents and how their ranking changes from year to year **/
SELECT
year,
day,
Total_Accidents,
Ranking
FROM
(SELECT 
DENSE_RANK()OVER(PARTITION BY YEAR(dc.clean_date) ORDER BY COUNT(dc.case_id_pkey) DESC) AS Ranking,
COUNT(dc.case_id_pkey) as Total_Accidents,
YEAR(dc.clean_date) as year,
DAYNAME(dc.clean_date) as day
FROM dim_crashes dc
GROUP BY 
YEAR(dc.clean_date),DAYNAME(dc.clean_date)) tt
WHERE Ranking =1
ORDER BY year desc;

<img width="352" height="411" alt="image" src="https://github.com/user-attachments/assets/4575de35-87d8-4a10-bb28-f3be87369892" />

/**3. What are the top 3 times of day with the highest number of injuries and how has their ranking changed over time? **/

WITH TOP3_whole_range AS (
SELECT
DENSE_RANK()OVER(ORDER BY SUM(dv.number_injured) DESC) Ranking, 
SUM(dv.number_injured) as Totals,
dc.Time_Of_Day_Range
FROM dim_crashes dc
	 LEFT JOIN dim_victims_final dv
		ON dv.case_id_pkey=dc.case_id_pkey
GROUP BY dc.Time_Of_Day_Range
ORDER BY SUM(dv.number_injured) desc
),

Selection AS (
SELECT 
Time_Of_Day_Range,
Totals
FROM TOP3_whole_range
WHERE Ranking <=3),

Changes AS (
SELECT
DENSE_RANK()OVER(PARTITION BY YEAR(dc.clean_date) ORDER BY SUM(dv.number_injured) DESC) Ranking, 
SUM(dv.number_injured) as Total,
dc.Time_Of_Day_Range,
YEAR(dc.clean_date) as rok
FROM dim_crashes dc
	 LEFT JOIN dim_victims_final dv
		ON dv.case_id_pkey=dc.case_id_pkey
GROUP BY dc.Time_Of_Day_Range, YEAR(dc.clean_date)
ORDER BY SUM(dv.number_injured) desc
),

Prev_period AS (
SELECT
c.Time_Of_Day_Range,
c.rok,
c.Total,
c.Ranking,
LAG(Ranking) OVER (PARTITION BY Time_Of_Day_Range ORDER BY rok) AS PREV
FROM Changes c
	INNER JOIN Selection s
		ON c.Time_Of_Day_Range=s.Time_Of_Day_Range
ORDER BY rok desc)

SELECT 
Time_Of_Day_Range,
rok,
Total,
Ranking,
PREV,
CASE
	WHEN Ranking = PREV THEN "no change" ELSE "change"
END AS rank_diff
FROM Prev_period;

<img width="496" height="415" alt="image" src="https://github.com/user-attachments/assets/855ded92-4e24-464c-9709-25539903ef31" />

/**4.Which time of day and day of the week combinations are most dangerous in terms of the number of injuries? **/

WITH SUMIK AS (SELECT 
SUM(dv.number_injured) AS Total,
CONCAT(dc.time_of_day_range,' ','&',' ',DAYNAME(dc.clean_date)) AS Combination
FROM dim_crashes dc
	LEFT JOIN dim_victims_final dv
		ON dc.case_id_pkey=dv.case_id_pkey
GROUP BY 
CONCAT(dc.time_of_day_range,' ','&',' ',DAYNAME(dc.clean_date))
ORDER BY Total DESC),

Ranking AS (SELECT
Combination, 
DENSE_RANK() OVER(ORDER BY Total DESC) AS Ranks
FROM SUMIK)

SELECT *
FROM Ranking
WHERE Ranks <=3;

<img width="252" height="91" alt="image" src="https://github.com/user-attachments/assets/59655609-045d-42ff-95a6-47e9e9b46c84" />

/** 5.Which vehicle types are most often involved in accidents resulting in death or serious injury? **/
WITH Agregate AS (SELECT
dp.stwd_vehicle_type,
dv.collision_severity,
SUM(dv.number_injured) AS Total_Injured,
SUM(dv.number_killed) AS Total_Killed
FROM dim_parties dp
inner JOIN dim_victims_final dv
ON dp.party_id=dv.party_id
WHERE dv.collision_severity IN ('Fatal','Injury (Severe)')
GROUP BY dp.stwd_vehicle_type,dv.collision_severity)

SELECT 
	stwd_vehicle_type,
    SUM(CASE 
			WHEN collision_severity = 'Injury (Severe)' THEN Total_Injured ELSE 0 END)AS Injury_Severe,
	SUM(CASE 
			WHEN collision_severity = 'Fatal' THEN Total_Killed ELSE 0 END)AS Fatal
	FROM Agregate
    GROUP BY stwd_vehicle_type;

<img width="352" height="341" alt="image" src="https://github.com/user-attachments/assets/13782049-b6af-4e00-a3b5-dca1335aaef9" />



