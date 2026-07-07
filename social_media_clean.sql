SELECT * 
FROM social_media_screentime_mental_health_2026;

SELECT * 
FROM social_media_clean;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null values or Blank values
-- 4. Remove Any Columns or Rows

CREATE TABLE social_media_clean AS
SELECT *
FROM social_media_screentime_mental_health_2026;

-- to see the column list -- 
DESCRIBE social_media_clean;
-- to check for duplicate -- 
SELECT
	participant_id,
    age,
    gender,
    occupation,
    region,
    most_used_platform,
    platforms_used_count,
    daily_screen_hours,
    daily_notifications,
    night_time_use,
    minutes_to_first_check_after_waking,
    primary_purpose,
    avg_sleep_hours,
    anxiety_score_0to27,
    low_mood_score_0to27,
    life_satisfaction_1to10,
    loneliness_1to10,
    self_esteem_1to10,
    fomo_1to10,
    social_comparison_1to10,
    physical_activity_days_per_week,
    uses_screen_time_limits,
    attempted_digital_detox,
    seeks_mental_health_support,
    wellbeing_band,
    COUNT(*) AS duplicate_count
FROM social_media_clean
GROUP BY
		participant_id,
    age,
    gender,
    occupation,
    region,
    most_used_platform,
    platforms_used_count,
    daily_screen_hours,
    daily_notifications,
    night_time_use,
    minutes_to_first_check_after_waking,
    primary_purpose,
    avg_sleep_hours,
    anxiety_score_0to27,
    low_mood_score_0to27,
    life_satisfaction_1to10,
    loneliness_1to10,
    self_esteem_1to10,
    fomo_1to10,
    social_comparison_1to10,
    physical_activity_days_per_week,
    uses_screen_time_limits,
    attempted_digital_detox,
    seeks_mental_health_support,
    wellbeing_band
HAVING COUNT(*) > 1;

-- Remove extra spaces --
UPDATE social_media_clean
SET 
	participant_id = TRIM(participant_id),
    gender = TRIM(gender),
    occupation = TRIM(occupation),
    region = TRIM(region),
    most_used_platform = TRIM(most_used_platform),
    night_time_use = TRIM(night_time_use),
    primary_purpose = TRIM(primary_purpose),
    uses_screen_time_limits = TRIM(uses_screen_time_limits),
    attempted_digital_detox = TRIM(attempted_digital_detox),
    seeks_mental_health_support = TRIM(seeks_mental_health_support),
    wellbeing_band = TRIM(wellbeing_band);
    
-- to check for null values and blank values --
SELECT
    SUM(participant_id IS NULL) AS participant_id_null,
    SUM(age IS NULL) AS age_null,
    SUM(gender IS NULL) AS gender_null,
    SUM(occupation IS NULL) AS occupation_null,
    SUM(region IS NULL) AS region_null,
    SUM(most_used_platform IS NULL) AS platform_null,
    SUM(platforms_used_count IS NULL) AS platforms_used_count_null,
    SUM(daily_screen_hours IS NULL) AS screen_hours_null,
    SUM(daily_notifications IS NULL) AS notifications_null,
    SUM(night_time_use IS NULL) AS night_time_use_null,
    SUM(minutes_to_first_check_after_waking IS NULL) AS first_check_null,
    SUM(primary_purpose IS NULL) AS purpose_null,
    SUM(avg_sleep_hours IS NULL) AS sleep_hours_null,
    SUM(anxiety_score_0to27 IS NULL) AS anxiety_null,
    SUM(low_mood_score_0to27 IS NULL) AS low_mood_null,
    SUM(life_satisfaction_1to10 IS NULL) AS satisfaction_null,
    SUM(loneliness_1to10 IS NULL) AS loneliness_null,
    SUM(self_esteem_1to10 IS NULL) AS self_esteem_null,
    SUM(fomo_1to10 IS NULL) AS fomo_null,
    SUM(social_comparison_1to10 IS NULL) AS social_comparison_null,
    SUM(physical_activity_days_per_week IS NULL) AS activity_null,
    SUM(uses_screen_time_limits IS NULL) AS limits_null,
    SUM(attempted_digital_detox IS NULL) AS detox_null,
    SUM(seeks_mental_health_support IS NULL) AS support_null,
    SUM(wellbeing_band IS NULL) AS wellbeing_null
FROM social_media_clean;

SELECT
    COUNT(*) AS blank_gender
FROM social_media_clean
WHERE TRIM(gender) = '';

SELECT *
FROM social_media_clean
WHERE
    age IS NULL
    OR daily_screen_hours IS NULL
    OR primary_purpose IS NULL
    OR avg_sleep_hours IS NULL
    OR wellbeing_band IS NULL;
    
-- to convert blank into NULL--
UPDATE social_media_clean
SET gender = NULL
WHERE TRIM(gender) = 'Unknown';

-- to check if it work --
SELECT COUNT(*)
FROM social_media_clean
WHERE gender IS NULL;

SELECT DISTINCT gender
FROM social_media_clean;

-- To remove/delete null values--
DELETE 
FROM social_media_clean
WHERE gender IS NULL;

SELECT * 
FROM social_media_clean;
    
