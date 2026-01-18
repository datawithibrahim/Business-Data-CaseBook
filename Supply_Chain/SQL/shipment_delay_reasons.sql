/*
    What are the reasons behind the shipment delays
    Delays exists, but why they occur is unclear 
*/

SELECT  
    Logistics_Delay_Reason,
    COUNT(*) as delay_count
from cleaned_logistics_dataset
WHERE Logistics_Delay = 1
GROUP BY Logistics_Delay_Reason
ORDER by delay_count;

/*
    The abve query shows the analysis for the reason that why the shipments are 
    getting delayed

    this tells us operational vs external problem
    shows some data quality issues as well 

    If the reason is traffic then improve route optimization
    If Weather then add buffer time
    If Others is high the quality and data logging must be imroved this helps to have better analysis
*/