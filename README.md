##  Database Architecture (Star Schema)
The project is built around a relational star schema designed for transactional performance and analytical reporting:
- **`fact_deliveries` (Central Fact Table):** Records unique delivery transactions, metrics (items, satisfaction ratings, distances), and foreign keys.
- **`dim_employees` (Dimension):** Descriptive data regarding delivery personnel (hire dates, contract types, transport modes).
- **`dim_client` (Dimension):** Client profiles and account registration timelines.
- **`dim_warehouse` (Dimension):** Warehouse locations, sizes, and hubs.

---

##  Key Analytical Queries

### 1. Operational Bottlenecks (`1_operational_bottlenecks.sql`)
* **Business Question:** What factors contribute to delivery delays? 
* **Methodology:** Investigates employee onboarding recency, contract type (`Permanent` vs. `Contractor`), and transport mode (`e-bike`, `car`, `van`) against delivery failures. Utilizes CTEs, conditional aggregation (`SUM(CASE WHEN...)`), and window functions (`DENSE_RANK()`) to rank failure profiles.

### 2. Client & Warehouse Distribution (`2_client_warehouse_distribution.sql`)
* **Business Question:** Where are logistical cost-drains and inefficiencies occurring in our supply network?
* **Methodology:** Aggregates delivery volumes and distances by warehouse-client pairs to identify unnecessary long-distance fulfillment routes and optimize inventory stocking locations.

### 3. Customer Health & Retention (`3_customer_health_and_retention.sql`)
* **Business Question:** How do customer tenure and recency correlate with satisfaction ratings and churn risk?
* **Methodology:** Evaluates client lifespan (`tenure_years`) against activity recency (`years_since_last_delivery`) and satisfaction averages to distinguish between churned accounts and dormant businesses.

