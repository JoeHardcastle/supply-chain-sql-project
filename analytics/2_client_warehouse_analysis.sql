-- In this query I wanted to have a look at just what warehouses are handling the goods for deliveries to the 
-- clients. 
-- The necessary joins were made to render the table possible. 
-- In the first column are the clients' names and next to it are the total km distance between the warehouse and 
-- the client. (Note: total km travelled by employees have not been calculated as there is no information to 
-- suggest the nature of the delivery rounds- whether it is a straight to and from or one of many deliveries
-- on a round. As an arbitary figure, the distance between warehouse and client is used to give a roundabout figure 
-- of how much travel has been done, relative to when deliveries are sent from the other warehouses.
--- Also, the total number deliveries per warehouse/client pair have been calculated, as have the total number
-- of items.
-- The column "total_km" is a simple calculation of 1) distance between client and warehouse, multiplied by 2) 
-- total number of deliveries, solely to allow the person viewing the table to see the bigger picture of just how
-- many km have been travelled moving from what could be the most out of the way warehouse to a client.

-- The focus of the query was the client and the descending order (in km travelled) from the warehouses that 
-- despatched on that particular delivery.

-- Such a table could show clearly the instances finances could be drained on unnecessarily long journeys. 
-- It could also lead to improvements in organisation of deliveries and as to how the warehouses are stocked.



SELECT 
    c.client_name AS client_name,
    SUM(f.distance_from_warehouse_km) AS delivery_distance,
    w.name AS warehouse_name,
    COUNT(f.delivery_id) AS total_nr_deliveries,
    ((SUM(f.distance_from_warehouse_km)) * COUNT(f.delivery_id)) AS total_km,
    SUM(f.number_of_items) AS total_nr_items_delivered    
FROM fact_deliveries f 
LEFT JOIN dim_warehouse w ON f.warehouse_id = w.warehouse_id
LEFT JOIN dim_client c ON f.client_id = c.client_id
GROUP BY c.client_name, w.name
ORDER BY client_name ASC, total_nr_deliveries DESC, delivery_distance DESC, total_nr_items_delivered;



