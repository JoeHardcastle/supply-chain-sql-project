-- This query relates to customer satisfaction levels.
-- I have arranged it so a table is created which shows the client names in the first column and the satisfaction
-- rating in the second column. It has been order so that there is a downward decrease in satisfaction.

-- I have opted to have the dates of client registration and date of last delivery in two of the columns, as well 
-- as the length of time (expressed in years, thanks to the syntax:
--          ROUND((CURRENT_DATE - c.date_registered_as_client)::NUMERIC / 365.25, 2)
--      and
--          ROUND((CURRENT_DATE - MAX(f.date_of_delivery))::NUMERIC / 365.25, 2))
-- The implications of these columns are that they could allow to see if low ratings coincide with a last delivery
-- being made a long time ago, compared to the other clients: a non returning client, following what they consider
-- to be a bad experience. 
-- Also, it could be seen whether or not the older clients are returning because of their satisfaction with the
-- service being provided to them. 
-- Could a high satifaction level and a long period between the present day and last delivery date indicate the 
-- possible end of the client's business activity.
-- Of course, this could be developed upon. 
-- It is important to remember that this query (as with the other two) are using only a small quantity of test data.
-- If a real life data set was used, the table produced would more than likely show more realistic information than 
-- what has been presented here.




SELECT
    c.client_name AS client,
    ROUND(AVG(f.satisfaction_rating), 2) AS avg_satisfaction_rating,
    c.date_registered_as_client AS client_registration_date,
    ROUND((CURRENT_DATE - c.date_registered_as_client)::NUMERIC / 365.25, 2) AS tenure_years,
    MAX(f.date_of_delivery) AS last_delivery,
    ROUND((CURRENT_DATE - MAX(f.date_of_delivery))::NUMERIC / 365.25, 2) AS years_since_last_delivery
FROM fact_deliveries f 
LEFT JOIN dim_client c ON f.client_id = c.client_id
GROUP BY c.client_name, c.date_registered_as_client
ORDER BY avg_satisfaction_rating DESC, tenure_years DESC, last_delivery DESC;