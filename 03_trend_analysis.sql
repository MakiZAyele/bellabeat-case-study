### This query was ran to find out summary statistics on daily activity making sure to filter out total steps 0 and sedentary minutes < 1440 minutes(since we considered 0 steps and 1440 minutes(24 hours)to be considered as non-wear.)
SELECT 
  ROUND(AVG(TotalSteps), 0) AS avg_steps,
  MAX(TotalSteps) AS max_steps,
  ROUND(AVG(Calories), 0) AS avg_calories,
  ROUND(AVG(VeryActiveMinutes), 1) AS avg_very_active_mins,
  ROUND(AVG(SedentaryMinutes), 1) AS avg_sedentary_mins
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.daily_activity`
WHERE 
  TotalSteps > 0
  AND SedentaryMinutes < 1440;

### This query was ran to find out summary statistics on sleep making sure to filter out to >=60 minutes of sleep(since  it could represent the user testing the product or it could represent a nap not a full night sleep.)
SELECT 
  ROUND(AVG(TotalMinutesAsleep) / 60, 2) AS avg_hours_asleep,
  ROUND(AVG(TotalTimeInBed) / 60, 2) AS avg_hours_in_bed,
  MIN(TotalMinutesAsleep) / 60 AS min_hours_asleep,
  MAX(TotalMinutesAsleep) / 60 AS max_hours_asleep
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_unique`
WHERE 
  TotalMinutesAsleep >= 60;

### After the summary statistics, in order to get some insights I ran some correlation queries

### This query was used to create a table that can show if there is an interaction between activity intensity and calories burned
SELECT 
  Id,
  ROUND(AVG(VeryActiveMinutes), 1) AS avg_very_active_mins,
  ROUND(AVG(Calories), 0) AS avg_calories_burned
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.daily_activity`
WHERE 
  TotalSteps > 0
GROUP BY 
  Id
ORDER BY 
  avg_very_active_mins DESC;

### This query was ran to identify how frequent users wore the smart device by seeing how many valid active dayseach unique Id logged data
SELECT 
  Id,
  COUNT(ActivityDate) AS days_tracked,
  ROUND((COUNT(ActivityDate) / 31.0) * 100, 1) AS adherence_percentage
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.daily_activity`
WHERE 
  TotalSteps > 0 
  AND SedentaryMinutes < 1440
GROUP BY 
  Id
ORDER BY 
  days_tracked DESC;

### this query was run to find if there is an interaction between high very active minutes and high step count
SELECT 
  Id,
  ROUND(AVG(TotalSteps), 0) AS avg_steps,
  ROUND(AVG(VeryActiveMinutes), 1) AS avg_very_active_mins,
  ROUND(AVG(Calories), 0) AS avg_calories
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.daily_activity`
WHERE 
  TotalSteps > 0 
  AND SedentaryMinutes < 1440
GROUP BY 
  Id
ORDER BY 
  avg_steps DESC;



