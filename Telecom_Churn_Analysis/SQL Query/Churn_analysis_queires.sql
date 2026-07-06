CREATE DATABASE IF NOT EXISTS telecom_churn_analysis;
USE telecom_churn_analysis;
DROP TABLE IF EXISTS telecom_customers;
SELECT * FROM segmented_customers;
-- 1.Total Customers 
SELECT COUNT(*) AS Total_Customers
FROM segmented_customers;

SELECT 
    ROUND(
        100 * SUM(Churned_Flag) / COUNT(*),
        2
    ) AS Churn_Rate
FROM segmented_customers;
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(Churned_Flag) AS Churned_Customers,
    
    ROUND(
        100 * SUM(Churned_Flag) / COUNT(*),
        2
    ) AS Churn_Rate

FROM segmented_customers

GROUP BY Contract

ORDER BY Churn_Rate DESC;

SELECT
    Internet_Type,
    
    COUNT(*) AS Total_Customers,
    
    SUM(Churned_Flag) AS Churned_Customers

FROM segmented_customers

GROUP BY Internet_Type

ORDER BY Churned_Customers DESC;

SELECT
    ROUND(SUM(Monthly_Charge),2) AS Monthly_Revenue_Loss

FROM segmented_customers

WHERE Customer_Status = 'Churned';

SELECT
    Churn_Reason,
    
    COUNT(*) AS Customers

FROM segmented_customers

WHERE Customer_Status = 'Churned'

GROUP BY Churn_Reason

ORDER BY Customers DESC

LIMIT 10;

SELECT
    Payment_Method,
    
    COUNT(*) AS Total_Customers,
    
    SUM(Churned_Flag) AS Churned_Customers

FROM segmented_customers

GROUP BY Payment_Method

ORDER BY Churned_Customers DESC;
SELECT
    Customer_ID,
    Contract,
    Internet_Type,
    Monthly_Charge,
    Customer_Status

FROM segmented_customers

WHERE Contract = 'Month-to-Month'
AND Internet_Type = 'Fiber Optic'
AND Customer_Status = 'Churned';

SELECT
    Customer_Segmentation,
    
    COUNT(*) AS Customers

FROM segmented_customers

GROUP BY Customer_Segmentation;

SELECT
    Customer_Segmentation,
    
    ROUND(SUM(Monthly_Charge),2) AS Revenue

FROM segmented_customers

GROUP BY Customer_Segmentation

ORDER BY Revenue DESC;

SELECT
    Tenure_Groups,
    
    COUNT(*) AS Total_Customers,
    
    SUM(Churned_Flag) AS Churned_Customers

FROM segmented_customers

GROUP BY Tenure_Groups

ORDER BY Churned_Customers DESC;