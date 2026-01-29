📉 End-to-End Telco Customer Churn Analysis

🚀 Project Overview

This project is an end-to-end data analysis pipeline designed to identify the root causes of customer churn in a telecommunications company. 

Using a dataset of 7,000+ customers, I built a solution that:
1. Cleans and processes raw data using Python (Pandas).
2. Warehouses the data in a relational database (MySQL).
3. Visualizes key business metrics via an interactive dashboard (Power BI).

The goal was to move beyond simple reporting and answer the "Why" behind customer attrition—specifically identifying high-risk segments like Fiber Optic users and new customers.

💐💐💐

🛠️ Tech Stack & Architecture

👉 ETL & Data Cleaning: Python (Pandas, NumPy)
👉 Database Management: MySQL 8.0 (Command Line & Workbench)
👉 Database Connection: SQLAlchemy, PyMySQL
👉 Visualization & Reporting: Microsoft Power BI
👉 IDE: PyCharm Community Edition

🔄 The Pipeline Workflow:

1. Raw CSV (`WA_Fn-UseC_-Telco-Customer-Churn.csv`) → Ingested by Python.
2. Data Cleaning → Handled missing values, converted `TotalCharges` to numeric, and removed duplicates.
3. Database Load → Automating upload to MySQL Server (Port 3307) via SQLAlchemy Engine.
4. SQL Analysis → Ran queries to validate data integrity and extract initial insights.
5. Power BI Connection → Direct Query/Import from MySQL Database to build the dashboard.

💐💐💐

📊 Key Business Insights (The "So What?")

Through SQL analysis and Power BI visualization, three critical churn drivers were identified:

👉 The "Fiber Optic" Trap
⁕ Finding: Customers with Fiber Optic internet have a churn rate approximately 3x higher than DSL users.
⁕ Business Impact: The "premium" service is actually the primary bleed point.
⁕ Recommendation: Investigate service reliability and pricing competitiveness for Fiber Optic plans immediately.

👉 The "First Year" Danger Zone
⁕ Finding: An Area Chart analysis reveals a massive spike in churn during months 0–12. Once a customer survives the first year, retention rates stabilize significantly.
⁕ Recommendation: Implement a specialized "Onboarding Concierge" program for new sign-ups to survive the first 6 months.

👉 Payment Friction
⁕ Finding: Customers paying via Electronic Check have significantly higher churn compared to those using Credit Cards or Bank Transfers (Auto-pay).
⁕ Recommendation: Incentivize users to switch to Auto-pay by offering a small discount (e.g., $5 off for 6 months).

💐💐💐

💻 Technical Steps Executed

Step 1: Python ETL (Extract, Transform, Load)
Raw data contained blank strings in the `TotalCharges` column, which prevented SQL ingestion.
⁕ Solution: Used `pd.to_numeric(errors='coerce')` to handle non-numeric data and filled `NaN` values with 0.
⁕ Database Upload: Implemented `SQLAlchemy` with `PyMySQL` driver to bypass local file permission errors (Error 3948) and connect to a custom MySQL port (3307).

Step 2: SQL Logic
⁕ Data integrity was verified using aggregation queries before visualization.
```sql
⁕ Query to identify the highest churn internet service
SELECT InternetService, Churn, COUNT(*) as Count
FROM customers
GROUP BY InternetService, Churn
ORDER BY Count DESC;

Step 3: Power BI Dashboarding
Built a 6-point interactive dashboard featuring:
✔️ KPI Cards: Total Revenue Lost, Churn Rate.
✔️ Demographic Slicers: Dynamic filtering by Senior Citizen status and Gender.
✔️ Visuals: Clustered Bar Chart for Internet Service analysis.
            ⁕ Area Chart for Tenure vs. Churn trends.
            ⁕ 100% Stacked Column for Tech Support impact analysis.

🚀 How to Run This Project

Clone the repository:

👉 git clone (https://github.com/priyanka-data-analyst/Telco-Customer-Churn-Analysis)]

✔️ Install dependencies:
pip install pandas sqlalchemy pymysql

✔️ Setup MySQL:
⁕ Create a database named telco_churn.
⁕ Update the password variable in upload_to_sql.py.

✔️ Run the ETL script:
python upload_to_sql.py

✔️ Open Power BI:
⁕ Open Telco_Dashboard.pbix.
⁕ Edit Data Source settings to point to your local MySQL instance.

👤 Author
Priyanka Deshpande Data Analyst | Python | SQL | Power BI 
[Link to Portfolio/LinkedIn]
























