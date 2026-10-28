jhrdcstl77@gmail.com | github.com/JoeHardcastle

## Database Architecture (Star Schema)
The project is built around a relational star schema designed for analysis of company performance focusing on the relationships between the employees, warehouses and clients:
- **`fact_deliveries` (Central Fact Table):** Records the data associated with each unique delivery, metrics such as delivery dates, number of items, satisfaction ratings and distance from warehouse, as well as foreign keys.
- **`dim_employees` (Dimension):** Contains data specific to each of the employees (the delivery drivers), and includes such variables as: hire dates, contract types and transport modes.
- **`dim_client` (Dimension):** Records the names and the dates on which they registered with the company.
- **`dim_warehouse` (Dimension):** Records the locations and sizes of the warehouses.

---

## Key Analytical Queries

### 1. Hindering factors to operations (`1_hindering_factors.sql`)
- **Business Question:** What factors might contribute to delivery delays? 
- **Methodology:** Takes into account the length of time the employee has been part of the company, contract type (`Permanent` vs. `Contractor`), and transport mode (`e-bike`, `car`, `van`) with respect to late deliveries. A CTE and a conditional aggregation (`SUM(CASE WHEN...)`) have been incorporated into this query, along with a window function (`DENSE_RANK()`) to rank failure profiles.

### 2. Client & Warehouse Distribution (`2_client_warehouse_distribution.sql`)
- **Business Question:** Where are logistical cost-drains and inefficiencies occurring in our supply network?
- **Methodology:** Consideration has been given to delivery volumes and frequency as well as distances travelled by warehouse-client pairs (by means of aggregations) to identify unnecessary long-distance routes, which could be invaluable in optimising inventory stocking locations.

### 3. Customer Health & Retention (`3_customer_health_and_retention.sql`)
- **Business Question:** How do customer tenure and their most recent delivery date correlate with satisfaction ratings and risk of client loss?
- **Methodology:** Client lifespan (`tenure_years`) against recent activity (`years_since_last_delivery`) and satisfaction averages to distinguish between expired accounts and dormant businesses.
