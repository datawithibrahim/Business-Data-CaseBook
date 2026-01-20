/*
    Does traffic and weather together cause more delays ?

    Business Question:
        Is delay caused by a combination of factors instead of one ?

    Business Logic:
        Checking interaction between traffic status, weather delay and actual delay

    This shows highest delay occur when:
        Traffic = Detour 
        and weather is the reasosn which teh delays is affected more 

    This helped me to identufy compounding risk factors

    Recommendation:
        Dynamic rerouting during bad weather
        Delay Buffer for high-risk routes
        AI-Based traffic prediction

*/

use supply;

SELECT 
    Traffic_Status,
    Logistics_Delay_Reason,
    COUNT(*) AS total_cases,
    SUM(Logistics_Delay) AS delayed_cases
FROM cleaned_logistics_dataset
GROUP BY Traffic_Status, Logistics_Delay_Reason
ORDER BY delayed_cases DESC;
