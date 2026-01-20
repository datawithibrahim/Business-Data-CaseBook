
/*
    Does waiting time increase the probability of delay? (Root Cause Analysis)

    Is Higher waiting time actually cause more delays, or is it just coincidental?

    Insights:
        Delay % sharply increases in High Waiting Time
        This confitms that waiting time is a leading indicator of delay

    Soloutions:
        Setting an alert if waiting time > 30 mins 
        this can imnprove dock scheduling 
        This will also reduce loading and unloading bottlenecks


*/
USE supply;

SELECT
    CASE
        WHEN Waiting_Time < 20 THEN 'Low Waiting'
        WHEN Waiting_Time BETWEEN 20 AND 40 THEN 'Medium Waiting'
        ELSE 'High Waiting'
    END AS waiting_bucket,
    
    COUNT(*) AS total_shipments,
    SUM(Logistics_Delay) AS delayed_shipments,
    ROUND(SUM(Logistics_Delay) * 100.0 / COUNT(*), 2) AS delay_percentage
FROM cleaned_logistics_dataset
GROUP BY waiting_bucket;
