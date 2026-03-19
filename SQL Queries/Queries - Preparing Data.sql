USE sanfrancisco_car_accidents;

/** Creating table to preapre loading data to them from raw csv files **/ 

CREATE TABLE stg_parties (
	unique_id INT, 
	cnn_intrsctn_fkey INT, 
	cnn_sgmt_fkey INT,
	case_id_pkey INT,
    tb_latitude VARCHAR(50),
	tb_longitude VARCHAR(50),
	geocode_source	VARCHAR(50),
	geocode_location VARCHAR(50),
	collision_datetime VARCHAR(50),
	collision_date VARCHAR(50),
	collision_time VARCHAR(50),
	accident_year INT,
	month VARCHAR(15),
	day_of_week VARCHAR(15),
	time_cat VARCHAR(50),
    juris VARCHAR(50),
	officer_id INT,
	reporting_district VARCHAR(50),
	beat_number	INT,
	primary_rd	INT,
	secondary_rd VARCHAR(50),
	distance INT,
	direction VARCHAR(50),
	weather_1 VARCHAR(50),
	weather_2 VARCHAR(50),
	collision_severity VARCHAR(50),
	type_of_collision VARCHAR(50),
	mviw VARCHAR(50),
	ped_action VARCHAR(50),
	road_surface VARCHAR(50),
	road_cond_1 VARCHAR(50),
	road_cond_2 VARCHAR(50),
	lighting VARCHAR(50),
	control_device VARCHAR(50),
	intersection VARCHAR(50),
	vz_pcf_code VARCHAR(50),
	vz_pcf_group VARCHAR(50),
	vz_pcf_description VARCHAR(50),
	vz_pcf_link VARCHAR(50),
	number_killed INT,
	number_injured INT,
	street_view	VARCHAR(50),
	dph_col_grp	VARCHAR(50),
	dph_col_grp_description	VARCHAR(50),
	party_number_ckey VARCHAR(50),
	party_type VARCHAR(50),
	at_fault VARCHAR(50),
	party_sex VARCHAR(50),
	party_age INT,
	party_sobriety VARCHAR(50),
	party_drug_physical VARCHAR(50),
	dir_of_travel VARCHAR(50),
	party_safety_equip_1 VARCHAR(50),
	party_safety_equip_2 VARCHAR(50),
	finan_respons VARCHAR(50),
	sp_info_1 VARCHAR(50),
	sp_info_2 VARCHAR(50),
	sp_info_3 VARCHAR(50),
	oaf_viol_cat VARCHAR(50),
	oaf_viol_section VARCHAR(50),
	oaf_violation_code VARCHAR(50),
	oaf_violation_suffix VARCHAR(50),
	oaf_1 VARCHAR(50),
	oaf_2 VARCHAR(50),
	party_number_killed	INT,
	party_number_injured INT,
	move_pre_acc VARCHAR(50),
	vehicle_year VARCHAR(50),
	vehicle_make VARCHAR(50),
	stwd_vehicle_type VARCHAR(50),
	race VARCHAR(50),
	inattention	VARCHAR(50),
	special_info_f VARCHAR(50),
	special_info_g VARCHAR(50),
	street_of_travel VARCHAR(50),
	vehicle_autonomous VARCHAR(50),
	point VARCHAR(50),
	data_as_of VARCHAR(50),
	data_updated_at	VARCHAR(50),
	data_loaded_at VARCHAR(50),
	analysis_neighborhood VARCHAR(50),
	supervisor_district	VARCHAR(50),
	police_district	VARCHAR(50)
);

CREATE TABLE stg_crashes(
	unique_id INT,
	cnn_intrsctn_fkey INT,
	cnn_sgmt_fkey INT,
	case_id_pkey INT,
	tb_latitude	VARCHAR(50),
	tb_longitude VARCHAR(50),
	geocode_source VARCHAR(50),
	geocode_location VARCHAR(50),
	collision_datetime VARCHAR(50),
	collision_date VARCHAR(50),
	collision_time VARCHAR(50),
	accident_year VARCHAR(50),
	month VARCHAR(50),
	day_of_week	VARCHAR(50),
	time_cat VARCHAR(50),
	juris VARCHAR(50),
	officer_id INT,
	reporting_district VARCHAR(50),
	beat_number	INT,
	primary_rd	INT,
	secondary_rd VARCHAR(50),
	distance INT,
	direction VARCHAR(50),
	weather_1 VARCHAR(50),
	weather_2 VARCHAR(50),
	collision_severity VARCHAR(50),
	type_of_collision VARCHAR(50),
	mviw VARCHAR(50),
	ped_action VARCHAR(50),
	road_surface VARCHAR(50),
	road_cond_1	VARCHAR(50),
	road_cond_2	VARCHAR(50),
	lighting VARCHAR(50),
	control_device VARCHAR(50),
	intersection VARCHAR(50),
	vz_pcf_code	VARCHAR(50),
	vz_pcf_group VARCHAR(50),
	vz_pcf_description VARCHAR(50),
	vz_pcf_link	VARCHAR(50),
	number_killed INT,
	number_injured INT,
	street_view	VARCHAR(50),
	dph_col_grp	VARCHAR(50),
	dph_col_grp_description	VARCHAR(50),
	party_at_fault VARCHAR(50),
	party1_type	VARCHAR(50),
	party1_dir_of_travel VARCHAR(50),
	party1_move_pre_acc	VARCHAR(50),
	party2_type	VARCHAR(50),
	party2_dir_of_travel VARCHAR(50),
	party2_move_pre_acc	VARCHAR(50),
	point VARCHAR(50),
	data_as_of VARCHAR(50),
	data_updated_at VARCHAR(50),
	data_loaded_at VARCHAR(50),
	analysis_neighborhood VARCHAR(50),
	supervisor_district	VARCHAR(50),
	police_district	VARCHAR(50)
);

CREATE TABLE stg_victims(
	unique_id INT,
	cnn_intrsctn_fkey INT,
	cnn_sgmt_fkey INT,
	case_id_pkey INT,
	tb_latitude	VARCHAR(50),
	tb_longitude VARCHAR(50),
	geocode_source VARCHAR(50),
	geocode_location VARCHAR(50),
	collision_datetime VARCHAR(50),
	collision_date VARCHAR(50),
	collision_time VARCHAR(50),
	accident_year VARCHAR(50),
	month VARCHAR(50),
	day_of_week VARCHAR(50),
	time_cat VARCHAR(50),
	juris VARCHAR(50),
	officer_id INT,
	reporting_district VARCHAR(50),
	beat_number	INT,
	primary_rd INT,
	secondary_rd INT,
	distance INT,
	direction VARCHAR(50),
	weather_1 VARCHAR(50),
	weather_2 VARCHAR(50),
	collision_severity VARCHAR(50),
	type_of_collision VARCHAR(50),
	mviw VARCHAR(50),
	ped_action VARCHAR(50),
	road_surface VARCHAR(50),
	road_cond_1	VARCHAR(50),
	road_cond_2	VARCHAR(50),
	lighting VARCHAR(50),
	control_device VARCHAR(50),
	intersection VARCHAR(50),
	vz_pcf_code	VARCHAR(50),
	vz_pcf_description VARCHAR(50),
	vz_pcf_link VARCHAR(50),
	number_killed VARCHAR(50),
	number_injured INT,
	street_view	VARCHAR(50),
	dph_col_grp	VARCHAR(50),
	dph_col_grp_description	VARCHAR(50),
	party_number_ckey INT,
	party_type	VARCHAR(50),
	at_fault VARCHAR(50),
	party_sex VARCHAR(50),
	party_age INT,
	party_sobriety VARCHAR(50),
	party_drug_physical	VARCHAR(50),
	dir_of_travel VARCHAR(50),
	party_safety_equip_1 VARCHAR(50),
	party_safety_equip_2 VARCHAR(50),
	finan_respons VARCHAR(50),
	sp_info_1 VARCHAR(50),
	sp_info_2 VARCHAR(50),
	sp_info_3 VARCHAR(50),
	oaf_viol_cat VARCHAR(50),
	oaf_viol_section VARCHAR(50),
	oaf_violation_code VARCHAR(50),
	oaf_violation_suffix VARCHAR(50),
	oaf_1 VARCHAR(50),
	oaf_2 VARCHAR(50),
	party_number_killed	INT,
	party_number_injured INT,
	move_pre_acc VARCHAR(50),
	vehicle_year VARCHAR(50),
	vehicle_make VARCHAR(50),
	stwd_vehicle_type VARCHAR(50),
	race VARCHAR(50),
	inattention	VARCHAR(50),
	special_info_f	VARCHAR(50),
	special_info_g	VARCHAR(50),
	street_of_travel VARCHAR(50),
	vehicle_autonomous VARCHAR(50),
	victim_id	INT,
	victim_role	VARCHAR(50),
	victim_sex	VARCHAR(50),
	victim_age	INT,
	victim_degree_of_injury	VARCHAR(50),
	victim_seating_position	VARCHAR(50),
	victim_safety_equip_1	VARCHAR(50),
	victim_safety_equip_2	VARCHAR(50),
	victim_ejected	VARCHAR(50),
	point VARCHAR(50),
	data_as_of	VARCHAR(50),
	data_updated_at	VARCHAR(50),
	data_loaded_at	VARCHAR(50),
	analysis_neighborhood VARCHAR(50),
	supervisor_district	VARCHAR(50),
	police_district	VARCHAR(50)
);

/** Loading data from desktop to created tables **/

LOAD DATA LOCAL INFILE 'C:/Users/Adrian/Desktop/Dane do projektu/Traffic_Crashes_Resulting_in_Injury__Parties_Involved_20260205.csv'
INTO TABLE stg_parties
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/Adrian/Desktop/Dane do projektu/Traffic_Crashes_Resulting_in_Injury_20260205.csv'
INTO TABLE stg_crashes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/Adrian/Desktop/Dane do projektu/Traffic_Crashes_Resulting_in_Injury__Victims_Involved_20260205.csv'
INTO TABLE stg_victims
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/** Cleaning raw data from scratch. 
During exploring the data I saw that some case_id from crash table comparing to case_id from victim table had wrong numbers of victims/kills
Thanks to this information belowe I prepare Query to prepare table with only valid data. Additionaly I saw, that for some time people who 
prepare the raw data in victim_table added whole number of victims/kills not only 1 or 0. 
For example, in the crash_table table, we had one row with information that there were 3 people injured, but in the victim_table table, 
we saw 3 separate rows for each of those 3 injured people. This meant that in each of those 3 rows, we had the number 3 as the number of 
injured people, which, after grouping, resulted in this particular case having 9 injured people (it should have 3, as in the crash table). 
This problem was solved with the case statement: "CASE WHEN party_number_injured > 1 THEN 1 ELSE party_number_injured
**/ 

CREATE TABLE fact_crashes AS 
WITH TT AS (SELECT 
	case_id_pkey AS crash_case_id_pkey, 
    MAX(number_killed) AS crash_number_killed,
    MAX(number_injured) AS crash_number_injured
FROM stg_crashes
GROUP BY case_id_pkey),

TS AS (SELECT
	case_id_pkey AS victim_case_id_pkey,
    SUM(CASE WHEN party_number_injured > 1 THEN 1 ELSE party_number_injured END) AS victim_number_injured,
	SUM(CASE WHEN party_number_killed > 1 THEN 1 ELSE party_number_killed END) AS victim_number_killed
FROM stg_victims
GROUP BY case_id_pkey),

valid_cases AS (SELECT
	sc.crash_case_id_pkey,
    sc.crash_number_killed,
    sc.crash_number_injured,
    sv.victim_case_id_pkey,
    sv.victim_number_killed,
    sv.victim_number_injured
FROM tt sc
	LEFT JOIN ts sv
		ON sc.crash_case_id_pkey=sv.victim_case_id_pkey
WHERE sc.crash_number_injured = sv.victim_number_injured AND sc.crash_number_killed = sv.victim_number_killed
ORDER BY sc.crash_number_injured DESC)

SELECT c.*,
	vc.victim_case_id_pkey,
    vc.victim_number_killed,
    vc.victim_number_injured
FROM stg_crashes c
JOIN valid_cases vc
    ON c.case_id_pkey = vc.victim_case_id_pkey;
    
    
/** CREATING NEW CLEAN TABLE "dim_crashes" which is contains only this case_id where number_injured and kills are the same as in our most
granuality table with victims data. Addtionaly it was added some Time_Of_Day_Range which will be healpfull with analysis in PowerBi**/

CREATE TABLE dim_crashes AS
	SELECT 
	t.case_id_pkey,
	t.tb_latitude,
	t.tb_longitude,
    t.clean_date,
	t.collision_time,
	t.Year_Of_Crash,
	t.Month_Of_Crash,
    t.Num_Of_Week_Crash,
    t.Hour_Of_Crash,
    CASE
		WHEN  t.Hour_Of_Crash >= 22 OR t.Hour_Of_Crash <= 4 THEN "Night"
		WHEN  t.Hour_Of_Crash BETWEEN 5 AND 10 THEN "Morning"
		WHEN  t.Hour_Of_Crash BETWEEN 11 AND 14 THEN "Noon"
        WHEN  t.Hour_Of_Crash BETWEEN 15 AND 18 THEN "Afternoon"
		WHEN  t.Hour_Of_Crash BETWEEN 19 AND 21 THEN "Evening" 
        ELSE "Not Matched"
        END AS Time_Of_Day_Range,
	t.primary_rd,
	t.weather_1,
	t.weather_2,
	t.type_of_collision,
    t.ped_action,
    t.road_surface,
    t.road_cond_1,
    t.road_cond_2,
    t.lighting,
	t.number_killed,
	t.number_injured
    FROM (SELECT 
    	c.case_id_pkey,
	c.tb_latitude,
	c.tb_longitude,
    STR_TO_DATE(c.collision_date,'%Y %M %d') AS clean_date,
	c.collision_time,
	YEAR(STR_TO_DATE(c.collision_date,'%Y %M %d')) AS Year_Of_Crash,
	MONTH(STR_TO_DATE(c.collision_date,'%Y %M %d')) AS Month_Of_Crash,
    WEEK(STR_TO_DATE(c.collision_date,'%Y %M %d')) AS Num_Of_Week_Crash,
    HOUR(STR_TO_DATE(c.Collision_time,'%H:%i:%s')) AS Hour_Of_Crash,
    c.primary_rd,
	c.weather_1,
	c.weather_2,
    c.type_of_collision,
    c.ped_action,
    c.road_surface,
    c.road_cond_1,
    c.road_cond_2,
    c.lighting,
	c.number_killed,
	c.number_injured
    FROM stg_crashes c
		 JOIN fact_crashes sc
			ON c.case_id_pkey=sc.case_id_pkey) t;

/** CREATING NEW CLEAN TABLE "Clean_parties" with only data that is matched with our clean_crashes data where thera are only validaed data **/
CREATE TABLE clean_parties AS
SELECT 
    p.case_id_pkey,
    CONCAT(p.case_id_pkey, '_', p.party_number_ckey) AS party_id,
    p.party_type,
    p.at_fault,
    p.party_sobriety,
    p.party_age,
    p.party_sex,
    p.party_drug_physical,
    p.vehicle_year,
    p.vehicle_make,
    p.stwd_vehicle_type,
    p.race,
    p.party_number_ckey,
    p.party_number_injured,
    p.party_number_killed
FROM stg_parties p
JOIN dim_crashes c
    ON p.case_id_pkey = c.case_id_pkey;

/** CREATING NEW CLEAN TABLE "Clean_Victims"**/

CREATE TABLE clean_victims AS
SELECT 
    v.case_id_pkey,
    CONCAT(v.case_id_pkey, '_', v.party_number_ckey) AS party_id,
    v.collision_severity,
    CASE 
		WHEN v.party_number_injured>1 THEN 1 ELSE v.party_number_injured END AS number_injured,
	CASE 
		when v.party_number_killed>1 THEN 1 ELSE v.party_number_killed END AS number_killed,
    v.finan_respons,
    v.tb_latitude,
    v.tb_longitude,
    v.victim_role,
    v.victim_sex,
    v.victim_age,
    v.victim_degree_of_injury,
    v.victim_seating_position,
    v.victim_safety_equip_1,
    v.victim_safety_equip_2,
    v.victim_ejected,
    v.party_number_ckey,
    v.race
    FROM stg_victims v
		JOIN dim_crashes c
			ON c.case_id_pkey = v.case_id_pkey;

CREATE TABLE clean_victimsS AS
SELECT 
    v.case_id_pkey,
    CONCAT(v.case_id_pkey, '_', v.party_number_ckey) AS party_id,
    v.collision_severity,
    CASE 
		WHEN v.party_number_injured>1 THEN 1 ELSE v.party_number_injured END AS number_injured,
	CASE 
		when v.party_number_killed>1 THEN 1 ELSE v.party_number_killed END AS number_killed,
    v.finan_respons,
    v.tb_latitude,
    v.tb_longitude,
    v.victim_role,
    v.victim_sex,
    v.victim_age,
    v.victim_degree_of_injury,
    v.victim_seating_position,
    v.victim_safety_equip_1,
    v.victim_safety_equip_2,
    v.victim_ejected,
    v.party_number_ckey,
    v.race
    FROM stg_victims v
		JOIN dim_crashes c
			ON c.case_id_pkey = v.case_id_pkey
	WHERE 
    v.case_id_pkey IS NOT NULL
    AND v.party_number_ckey IS NOT NULL
    AND v.victim_sex IS NOT NULL
    AND v.victim_age >= 1
    AND v.victim_degree_of_injury IS NOT NULL
	AND v.tb_latitude IS NOT NULL
    AND v.tb_longitude IS NOT NULL;

/*Creating final parties table */

CREATE TABLE dim_parties AS
SELECT 
    p.case_id_pkey,
    p.party_id,
    p.party_type,
    p.at_fault,
    p.party_sobriety,
    p.party_age,
    p.party_sex,
    p.party_drug_physical,
    p.vehicle_year,
    p.vehicle_make,
    p.stwd_vehicle_type,
    p.race,
    p.party_number_ckey, 
    p.party_number_injured,
    p.party_number_killed
FROM clean_parties p
WHERE 
    p.party_age > 1
AND (
        (p.vehicle_year BETWEEN 1900 AND 2027)
        OR p.vehicle_year = ''
        OR p.vehicle_year IS NULL
    );

/** Trying to figured out what is going on with data by comparing values beetween this what i see in PowerBi and this what SQL. 
Thanks to this approach I saw, that in SQL we don't have any blank information about type_of_collision, but in PowerBi yes. 
Approaching this case for me it was clear that something goes wrong between tables. First of all I checked data from the most granuality
to lowest granuality (Most granuality is victims, then parties and at the end crashes). In PowerBi we have relation one to many 
between parties and victims (parties one and victims many). Thanks to this approach I saw, that we have some nulls in party_id. It means that 
party_id exist in victim table but don't exist in parties table. **/
SELECT
    p.party_type,
    SUM(v.number_injured) AS victims
FROM dim_victims v
	LEFT JOIN dim_parties p
	ON v.party_id=p.party_id
GROUP BY p.party_type
ORDER BY victims desc;

/*The results of the above queries show that we're missing some party_ids in the parties table. With this information, 
I decided to exclude this identifier from the analysis because it's due to two reasons. 
Reason one is that some identifiers are missing, and during the analysis, we want to get as much data as possible about a specific machine. 
The second reason is that these 7 records are a marginal percentage of the entire analysis, and will only affect how the data 
is summarized in PowerBI. */

CREATE TABLE dim_victims_final AS
SELECT 
    v.case_id_pkey,
    v.party_id,
    v.collision_severity,
    v.number_injured,
	v.number_killed,
    v.finan_respons,
    v.tb_latitude,
    v.tb_longitude,
    v.victim_role,
    v.victim_sex,
    v.victim_age,
    v.victim_degree_of_injury,
    v.victim_seating_position,
    v.victim_safety_equip_1,
    v.victim_safety_equip_2,
    v.victim_ejected,
    v.party_number_ckey,
    v.race
    FROM dim_victims v
		JOIN dim_parties p
			ON p.party_id = v.party_id;
    
/*Below querie to check If my acction works correctly. It works, we don't have any null.*/

SELECT
    p.party_type,
    SUM(v.number_injured) AS victims
FROM dim_victims_final v
	LEFT JOIN dim_parties p
	ON v.party_id=p.party_id
GROUP BY p.party_type
ORDER BY victims desc;

SET SESSION cte_max_recursion_depth = 20000;
/*Last Dim table with dates*/ 
CREATE TABLE dim_date AS
WITH RECURSIVE dates AS (
    SELECT DATE('1990-01-01') AS date_day
    UNION ALL
    SELECT DATE_ADD(date_day, INTERVAL 1 DAY)
    FROM dates
    WHERE date_day < '2030-12-31'
)
SELECT
    date_day,
    YEAR(date_day) AS year,
    MONTH(date_day) AS month,
    DAY(date_day) AS day,
    YEAR(date_day)*100 + MONTH(date_day) AS year_months,
    QUARTER(date_day) AS quarter,
    WEEK(date_day) AS week_of_year,
    DAYOFWEEK(date_day) AS day_of_week,
    DAYNAME(date_day) AS day_name,
    MONTHNAME(date_day) AS month_name,
    CASE
        WHEN DAYOFWEEK(date_day) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type
FROM dates;

/*Creating table with time*/
CREATE TABLE dim_time AS
WITH RECURSIVE hours AS (
    SELECT 0 AS hour_of_day
    UNION ALL
    SELECT hour_of_day + 1
    FROM hours
    WHERE hour_of_day < 23
)
SELECT
    hour_of_day,
    MAKETIME(hour_of_day,0,0) AS time_value,
    CASE
        WHEN hour_of_day BETWEEN 5 AND 10 THEN 'Morning'
        WHEN hour_of_day BETWEEN 11 AND 14 THEN 'Noon'
        WHEN hour_of_day BETWEEN 15 AND 18 THEN 'Afternoon'
        WHEN hour_of_day BETWEEN 19 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day
FROM hours;


ALTER TABLE dim_time
ADD COLUMN time_of_day_sort INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE dim_time
SET time_of_day_sort = 
CASE 
	WHEN hour_of_day BETWEEN 5 AND 10 THEN 1
    WHEN hour_of_day BETWEEN 11 AND 14 THEN 2
    WHEN hour_of_day BETWEEN 15 AND 18 THEN 3
    WHEN hour_of_day BETWEEN 19 AND 21 THEN 4
    ELSE 5
END
WHERE hour_of_day BETWEEN 0 AND 23;

SET SQL_SAFE_UPDATES = 1;

