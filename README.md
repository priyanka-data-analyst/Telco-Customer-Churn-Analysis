📉 Telco Customer Churn Analysis

🚀 Project Overview

👉 This project analyzes a dataset of 7,043 telecom customers to predict churn behavior and identify retention strategies. 
I utilized a "Modern Data Stack" approach:
1. Python: For initial data cleaning and exploratory data analysis (EDA).
2. Snowflake (SQL): For cloud-based data warehousing and identifying high-value churners.
3. Power BI: For building an interactive dashboard to visualize contract risks.

📊 Key Insights
⁕ High Risk Segment: Customers on Month-to-Month contracts have a churn rate of 42.7%, compared to just 2.8% for Two-Year contracts.
⁕ Payment Method: Electronic Check users are significantly more likely to leave than those using automatic payments.
⁕ Tenure Impact: The highest churn occurs within the first 6 months. If a customer stays past 12 months, their loyalty increases by 60%.


🛠️ Technical Workflow

1. Data Engineering (Python & Snowflake)
⁕ Python: Handled null values in `TotalCharges` and standardized column names.
⁕ Snowflake (SQL): Loaded the cleaned CSV into a cloud warehouse (`TELCO_CHURN_DB`). Wrote aggregation queries to validate churn counts before visualization.

SQL Proof of Concept:

[DRAG AND DROP YOUR SNOWFLAKE SCREENSHOT HERE]

<img width="1921" height="922" alt="snowflake_results" src="https://github.com/user-attachments/assets/8845854e-9737-4ccc-930c-30040727d150" />

(My SQL query running in the Snowflake Cloud Interface)

2. Visualization (Power BI)
⁕ DAX Measures: Calculated `Churn Rate %` and `Revenue at Risk`.
⁕ Visuals: Created a "Contract Type" slicer to allow the marketing team to filter by customer commitment level.

📂 File Structure
👉 `churn_cleaning.py`: Python script for preprocessing raw data.
👉 `snowflake_analysis.sql`: SQL scripts used for creating the database and running insights.
👉 `Snowflake_Results.png`: Screenshot of the query results in the Snowflake interface.
👉 `Churn_Dashboard.pbix`: The Power BI dashboard file.
👉 `Telco_Churn.csv`: The dataset used.

🚀 How to Run

1. Python: Run `churn_cleaning.py` to preprocess the data.
2. Snowflake: Open Snowflake and create a new worksheet.
   Copy/Paste the code from `snowflake_analysis.sql`.
   Load the `Telco_Churn.csv` data using the Load Wizard.
   Run the queries to generate insights.
3. Power BI: Open `Churn_Dashboard.pbix` to view the final report.

👤 Author
Priyanka Deshpande 
Data Analyst
