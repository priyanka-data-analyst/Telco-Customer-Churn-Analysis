-- 1. SETUP DATABASE
CREATE DATABASE IF NOT EXISTS TELCO_CHURN_DB;
USE DATABASE TELCO_CHURN_DB;
USE SCHEMA PUBLIC;

-- 2. CREATE TABLE STRUCTURE
-- This matches the standard Telco Customer Churn dataset columns
CREATE OR REPLACE TABLE CUSTOMER_CHURN (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(30),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(5)
);

-- 3. ANALYTICAL QUERIES (The "Portfolio" Part)

-- Query A: Calculate Overall Churn Rate
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churn_Count,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS Churn_Rate_Percent
FROM CUSTOMER_CHURN;

-- Query B: Which Contract type has the highest Churn?
SELECT 
    Contract,
    COUNT(*) AS Total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS Churn_Rate
FROM CUSTOMER_CHURN
GROUP BY Contract
ORDER BY Churn_Rate DESC;

-- Query C: High Value Customers (High Monthly Charges) who Churned
SELECT customerID, MonthlyCharges, Tenure, PaymentMethod
FROM CUSTOMER_CHURN
WHERE Churn = 'Yes' AND MonthlyCharges > 70
ORDER BY MonthlyCharges DESC
LIMIT 10;

-- Check if data is there
SELECT * FROM CUSTOMER_CHURN LIMIT 10;

-- Get the insight for your screenshot
SELECT 
    Contract,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Bill,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Count
FROM CUSTOMER_CHURN
GROUP BY Contract;