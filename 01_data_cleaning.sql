### When checking the data type of the SleepDay column, it is found to be a string. To convert it to a datetime format, we can use the PARSE_DATETIME function in SQL. The following query demonstrates how to parse the SleepDay string into a datetime format and then we put the updated data into a new table:
CREATE TABLE `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_cleaned` AS
SELECT 
  Id,
  COALESCE(
    SAFE.PARSE_DATETIME('%m/%d/%Y %H:%M:%S', SleepDay),
    SAFE.PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', SleepDay)
  ) AS SleepDay,
  TotalSleepRecords,
  TotalMinutesAsleep,
  TotalTimeInBed
FROM
  `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day`;

### This query was ran to see if there were any NULL values in both datasets and the names of the columns were used interchangably inthe WHERE clause:
SELECT *
FROM `invertible-fin-504723-d3.Bellabeat_capprj.daily_activity`
WHERE column_name IS NULL;

SELECT *
FROM `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_cleaned`
WHERE column_name IS NULL;

### This query was used to check if there are any duplicates 
### for the sleep day data
SELECT 
  Id, 
  SleepDay, 
  COUNT(*) AS record_count
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_cleaned`
GROUP BY 
  Id, 
  SleepDay
HAVING 
  COUNT(*) > 1;


### After finding 3 duplicates this  query was run to create a final deduplicated table:
CREATE TABLE `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_unique` AS
SELECT Id, SleepDay, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed
FROM (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Id, SleepDay ORDER BY TotalMinutesAsleep DESC) AS row_num
  FROM `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_cleaned`
)
WHERE row_num = 1;

### Trying to find duplicates in the activity day data 
SELECT 
  Id, 
  ActivityDate, 
  COUNT(*) AS row_count
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.dailyActivity_merged`
GROUP BY 
  Id, 
  ActivityDate
HAVING 
  COUNT(*) > 1;

### to check for the date ranges for both daily activity and sleep day respectively
SELECT 
  MIN(ActivityDate) AS earliest_date,
  MAX(ActivityDate) AS latest_date,
  COUNT(DISTINCT ActivityDate) AS total_unique_days
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.daily_activity`;

SELECT 
  MIN(ActivityDate) AS earliest_date,
  MAX(ActivityDate) AS latest_date,
  COUNT(DISTINCT ActivityDate) AS total_unique_days
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_cleaned`;

