# bellabeat-case-study
Google Data Analytics Capstone: Bellabeat smart device usage analysis using SQL &amp; Google Sheets to inform marketing strategies for women's health technology. Built by an aspiring Health Data Analyst.
# Bellabeat Smart Device Usage Analysis

##  Project Overview
As part of the junior data analyst portfolio, this project analyzes smart device fitness data (Fitbit) to discover user trends and translate those insights into high-level marketing recommendations for Bellabeat, a high-tech manufacturer of health-focused products for women.

##  Tools & Technologies Used
SQL (BigQuery):Data cleaning, deduplication (`ROW_NUMBER`), casting, and aggregation.
Google Sheets: Descriptive statistics and visualization generation.
PowerPoint: Executive slide deck presentation for stakeholders.

## Repository Structure
 `01_data_cleaning.sql` — Handles datetime parsing, NULL checks, and removing duplicate sleep records.
 `02_user_segmentation.sql` — Groups users into behavioral activity tiers (Sedentary to Highly Active) and sleep efficiency tiers.
 `03_trend_analysis.sql` — Explores correlations between active minutes, calorie burn, tracking adherence, and daily steps.

##  Key Findings & Insights
1. High Sedentary Load: Users averaged 929.4 sedentary minutes daily (~15.5 hours), indicating significant potential for in-app gentle movement reminders and stretching prompts during idle blocks.
2. User Activity Breakdown (N=34):
   Sedentary (<5k steps):12 users (35%) — Largest single user cohort
   Moderately Active (7.5k–10k steps): 8 users (24%)
   Highly Active (10k+ steps): 8 users (24%)
   Low Active (5k–7.5k steps):6 users (18%)
3. Activity Intensity vs. Calorie Burn:A strong positive correlation (r approx 0.58) exists between very active minutes and calories burned. Furthermore, step count strongly correlates with exercise intensity (r \approx 0.72), showing that peak step days were driven by intense workout sessions rather than passive walking.
4. Device Tracking Adherence: The most frequent usage frequency was 12 days out of the 32-day tracking period, showing drop-off over time and highlighting a need for morning wear reminders to boost daily engagement.
5. Sleep Patterns & Opportunities:
   Insufficient Sleep (<7h): 54.2% of users
   Optimal Sleep (7–9h): 41.7% of users
   Long Sleep (>9h): 4.2% of users
   While average cohort sleep efficiency sits at ~91.5% (7.02h asleep vs. 7.67h in bed), over half the users get less than 7 hours of sleep, creating a strong market opportunity for Bellabeat's personalized sleep coaching.

## Data Limitations & Bias
Sample Size & Demographics:The public dataset contains only 34 users and lacks gender demographic metadata. Because Bellabeat specifically designs products for women, future analysis should incorporate female-specific metrics (e.g., tracking movement and sleep variations across menstrual cycle phases).
Calorie Factors: While active minutes correlate with calorie burn, individual Basal Metabolic Rate (BMR) variations and body weight also significantly impact calorie output.

## Recommendations for Bellabeat Marketing & Product
Sedentary Nudges: Program the Bellabeat app to send gentle push notifications suggesting 5-minute stretching sessions during prolonged sedentary periods.
Morning Wear Reminders: Implement morning mobile reminders to encourage consistent daily device wear and reduce tracking drop-off.
Milestone Encouragement: Design target step-count campaigns encouraging low and moderately active users to reach daily movement goals.
In-App Sleep Coaching: Offer specialized sleep hygiene articles and coaching subscriptions tailored to the 54% of users logging under 7 hours of sleep.

## References
* Mobius. (2016). *Fitbit Fitness Tracker Data* [Data set]. Kaggle. https://www.kaggle.com/datasets/arashnic/fitbit
* National Sleep Foundation. (2015). National Sleep Foundation's updated sleep duration recommendations: Final report. *Sleep Health*, 1(4), 233–243. https://doi.org/10.1016/j.sleh.2015.08.003
* Tudor-Locke, C., & Bassett, D. R., Jr. (2004). How many steps/day are enough? Preliminary pedometer indices for public health. *Sports Medicine*, 34(1), 1–8. https://doi.org/10.2165/00007256-200434010-00001
* World Health Organization. (2020). *WHO guidelines on physical activity and sedentary behaviour*. World Health Organization. https://www.who.int/publications/i/item/9789240015128

##  Deliverables
Presentation Deck: [Link to your PowerPoint or PDF slides here]
