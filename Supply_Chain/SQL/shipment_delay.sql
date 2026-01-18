/*
Why are shipment delayed and how does ir affect revenue & operations
*/

/*
   Q1 - How many TotalShipments Were Delayed
   Q2 - Total Number of Shipments Delayed on Month 
   Q3 - Total Number of Logistics Delay by what reason
   Q4 - What will be the impact on revenue due to delay 
*/

SELECT 
    Logistics_Delay,
    COUNT(*) AS total_shipments
FROM cleaned_logistics_dataset
GROUP BY Logistics_Delay;

SELECT 
    MONTH(Timestamp) AS month,
    COUNT(*) AS total_shipments,
    SUM(Logistics_Delay) AS delayed_shipments
FROM cleaned_logistics_dataset
GROUP BY MONTH(Timestamp)
ORDER BY month;

SELECT 
    Logistics_Delay_Reason,
    COUNT(*) AS delay_count
FROM cleaned_logistics_dataset
WHERE Logistics_Delay = 1
GROUP BY Logistics_Delay_Reason
ORDER BY delay_count DESC;

SELECT 
    SUM(
        CASE 
            WHEN Logistics_Delay = 1 
            THEN User_Transaction_Amount 
            ELSE 0 
        END
    ) AS revenue_at_risk
FROM cleaned_logistics_dataset;
