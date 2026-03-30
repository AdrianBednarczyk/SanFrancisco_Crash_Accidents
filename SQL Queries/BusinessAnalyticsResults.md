/** Some fast cases to solved to show skills in SQL **/

**/**1. Does seat belt use affect the number of road accident casualties? Analyze the data on casualties and determine whether seat belt 
use reduces the severity of accidents. For each safety equipment category, calculate:
- the number of people involved in accidents
- the total number of injuries
- the total number of fatalities
- the percentage of injuries
- the percentage of fatalities

Then compare the results between:
- the use of seat belts
- the lack of seat belt use
Finally, indicate in which cases the lack of seat belt use most increases the risk of death in an accident.**/**

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

