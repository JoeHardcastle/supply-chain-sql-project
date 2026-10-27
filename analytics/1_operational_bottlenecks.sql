-- The data that provides me with clues that there are failures somewhere along the lines are: 
-- delivered on time and satisfaction ratings.  i would like to see: 1) the number of times a company been 
-- delivered to late, the latest date of late delivery, from which warehouse, name of employee, type of contract, 
-- and mode of transport. (note: do not provide me with any code at thi spoint please)

-- To understand where problems could be occuring in the worflow between employees, warehouses and clients,
-- I thought it would be interesting to see what could be causing the deliveries to be late.
-- Possible causes could be employee issues, of which I decided to investigate:
-- 1) Date of hire: perhaps new employees were more prone to getting lost on their new and unfamiliar delivery
-- rounds. Conversely, 'older' employees may become lethargic and tired of the work, leading to a poorer 
-- work performance.
-- 2) Contract type: the two contract types here are 'permanent' and 'contractor'... this could play a role 
-- toward working performance and loyalty to the employers, possibly with the permanent staff performing better.
-- 3) Transport mode: This could be a key reason why deliveries are late. For example, an e-bike may have an 
-- easier time passing through traffic build ups, compared  to a van.

-- Only employees with late deliveries were included in this query, which was permitted by the line:
--            "SUM(CASE WHEN f.delivered_on_time = FALSE THEN 1 ELSE 0 END) AS nr_late_deliveries"
-- 
-- Using the following lines:
-- "DENSE_RANK() OVER (
 --       PARTITION BY nr_late_deliveries
 --       ORDER BY hire_date DESC, contract_type DESC, transport_mode ASC"

 -- The data was partitioned so that the table's row were blocked by number of late deliveries, which were then
 -- sub-ordered by hire date, contract date and transport mode.




WITH late_deliveries AS (
    SELECT
        e.name AS name,
        e.hire_date AS hire_date,
        e.contract_type AS contract_type,
        e.transport_mode AS transport_mode,
        SUM(CASE WHEN f.delivered_on_time = FALSE THEN 1 ELSE 0 END) AS nr_late_deliveries
    FROM fact_deliveries f
    LEFT JOIN dim_employees e ON f.employee_id = e.employee_id
    GROUP BY e.name, e.hire_date, e.contract_type, e.transport_mode
    HAVING SUM(CASE WHEN f.delivered_on_time = FALSE THEN 1 ELSE 0 END) > 0
)
SELECT
    name, 
    nr_late_deliveries,
    hire_date, 
    contract_type,
    transport_mode,
    DENSE_RANK() OVER (
        PARTITION BY nr_late_deliveries
        ORDER BY hire_date DESC, contract_type DESC, transport_mode ASC
    ) AS late_deliveries_rank
FROM late_deliveries
ORDER BY nr_late_deliveries DESC;



