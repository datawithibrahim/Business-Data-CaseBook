/*
    Business Problem:
        Which assets are inefficient despite high utilization?
    
    Question:
        Are some trucks overused but still performing badly?
    
    Logic:
    High utilization ≠ high efficiency
    We check:
        High utilization
        High delay count

    Inights:
        This can helps us to analyze overloaded or poorly routed asset
        Helps business to fleet optimization

    Recommendatiom:
        Redistribute workload
        Service or replace inefficient assets
        Optimize routing for overloaded trucks
*/

use supply;

SELECT 
    Asset_ID,
    AVG(Asset_Utilization) AS avg_utilization,
    SUM(Logistics_Delay) AS total_delays
FROM cleaned_logistics_dataset
GROUP BY Asset_ID
HAVING AVG(Asset_Utilization) > 80
   AND SUM(Logistics_Delay) > 10
ORDER BY total_delays DESC;
