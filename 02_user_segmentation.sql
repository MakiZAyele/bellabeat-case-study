### After cleaning the data, user segmentation was done based on both daily activity(based on number of steps by activity level) ans sleep(based on hours asleep)
WITH user_averages AS (
  SELECT 
    Id,
    AVG(TotalSteps) AS avg_daily_steps
  FROM 
    `invertible-fin-504723-d3.Bellabeat_capprj.daily_activity`
  WHERE 
    TotalSteps > 0
  GROUP BY 
    Id
)
SELECT 
  Id,
  ROUND(avg_daily_steps, 0) AS avg_daily_steps,
  CASE 
    WHEN avg_daily_steps < 5000 THEN 'Sedentary'
    WHEN avg_daily_steps BETWEEN 5000 AND 7499 THEN 'Low Active'
    WHEN avg_daily_steps BETWEEN 7500 AND 9999 THEN 'Moderately Active'
    ELSE 'Highly Active (10k+)'
  END AS activity_tier
FROM 
  user_averages
ORDER BY 
  avg_daily_steps DESC;


SELECT 
  Id,
  ROUND(AVG(TotalMinutesAsleep) / 60, 2) AS avg_hours_asleep,
  ROUND(AVG(TotalTimeInBed) / 60, 2) AS avg_hours_in_bed,
  ROUND(AVG(TotalMinutesAsleep) / NULLIF(AVG(TotalTimeInBed), 0) * 100, 1) AS sleep_efficiency_pct,
  CASE 
    WHEN AVG(TotalMinutesAsleep) / 60 < 7 THEN 'Insufficient Sleep (<7h)'
    WHEN AVG(TotalMinutesAsleep) / 60 BETWEEN 7 AND 9 THEN 'Optimal Sleep (7-9h)'
    ELSE 'Long Sleep (>9h)'
  END AS sleep_tier
FROM 
  `invertible-fin-504723-d3.Bellabeat_capprj.sleep_day_unique`
WHERE 
  TotalMinutesAsleep >= 60
GROUP BY 
  Id
ORDER BY 
  avg_hours_asleep DESC;

