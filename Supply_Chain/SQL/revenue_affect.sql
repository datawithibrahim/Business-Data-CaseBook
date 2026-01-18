/*
    Business Problem

    How much revenue is affected by delays
    How to identify risks

    Delays may leads to revenue loss, but impact is unknown
*/

SELECT 
    SUM(
        case
            when Logistics_Delay = 1
            then User_Transaction_Amount
            ELSE 0
        END
    ) AS revenue_at_risk
FROM cleaned_logistics_dataset

/*
   This shows totlal money impacted due to delays
   This can help quanitify business loss And converts operational problem or financial problem

   If there is High rvenue at risk there must be a priority issue
   A business must Prioritize high-value orders
   Creates SLA for premium customers
   Track delayed revenue weekly
*/
