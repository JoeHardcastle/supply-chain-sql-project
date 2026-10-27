-- This is the script that populates the star schema with seed data.
-- The data is first inserted into the three tables: "dim_employees", "dim_client" and "dim_warehouse"
-- where foreign key entities are established, which then allow for the "fact_deliveries" to be populated 
-- with the data.


INSERT INTO dim_employees (name, hire_date, contract_type, transport_mode) VALUES
('Jimmy Davis', '2023-04-12', 'Permanent', 'e-bike'),
('Miles White', '2022-07-01', 'Contractor', 'car'),
('Alice Heath', '2025-06-03', 'Contractor', 'e-bike'),
('Lenny Corea', '2022-08-23', 'Permanent', 'e-bike'),
('Chick Zawinul', '2021-01-17', 'Permanent', 'van'),
('Joe Shorter', '2025-12-10', 'Contractor', 'car'),
('Billie Washington', '2021-03-18', 'Permanent', 'e-bike'),
('Wayne Williams', '2020-06-05', 'Contractor', 'car'),
('Tony Ayers', '2025-03-27', 'Permanent', 'van'),
('Bessie Holiday', '2024-01-06', 'Contractor', 'car'),
('Kevin Mouzon', '2022-04-16', 'Permanent', 'e-bike'),
('Alphonse Holdsworth', '2023-10-02', 'Contractor', 'car'),
('Allan Smith', '2026-09-14', 'Permanent', 'car'),
('Dinah Coltrane', '2022-11-19', 'Permanent', 'e-bike'),
('Trevor Southall', '2021-04-16', 'Contractor', 'e-bike'),
('Neville Reid', '2024-08-09', 'Permanent', 'car');


INSERT INTO dim_client (client_name, date_registered_as_client) VALUES
('Everlasting Gobstoppers Co.', '2022-07-08'),
('ACME Jokes Inc.', '2020-07-12'),
('Alexei Sails', '2019-08-27'),
('Yoda Porridge Co.', '2018-05-21'),
('Buffalo Bill Ltd', '2024-12-06'),
('Half Time Whistle Shop', '2022-04-11'),
('Bobby Chariot & Sons', '2021-10-20'),
('The Silver Machine Ltd', '2025-03-27'),
('Cobra Enterprises', '2023-07-23'),
('Hardcastle Fort Leasing Agency', '2021-03-15');


INSERT INTO dim_warehouse (name, location, size_of_warehouse) VALUES
('Central','City', 'Medium'),
('North', 'Suburban', 'Small'),
('East', 'City', 'Large'),
('South', 'Suburban', 'Medium'),
('West', 'Industrial', 'Large');


-- 4. Insert Fact Table: Deliveries (Linking to the IDs above)
INSERT INTO fact_deliveries (employee_id, client_id, warehouse_id, date_of_delivery,delivered_on_time, number_of_items, satisfaction_rating, distance_from_warehouse_km) VALUES
(1, 1, 1, '2023-03-08', TRUE, 5, 4.7, 23),
(7, 9, 2, '2022-06-15', TRUE, 3, 4.5, 40),
(3, 8, 3, '2025-12-12', FALSE, 12, 3.2, 18.7),
(8, 4, 4, '2020-08-24', TRUE, 15, 5, 53),
(12, 10, 1, '2021-08-17', FALSE, 7, 4.2, 16),
(9, 3, 5, '2019-05-29', TRUE, 12, 4.1, 23),
(16, 2, 3, '2020-07-21', FALSE, 8, 3.7, 28), 
(15, 5, 1, '2024-11-14', TRUE, 13, 4.4, 42),
(11, 6, 5, '2023-10-05', FALSE, 4, 3.9, 22),
(2, 1, 4, '2022-02-02', TRUE, 7, 4.8, 41),
(16, 5, 2, '2025-04-15', FALSE, 9, 3.2, 33),
(5, 10, 1, '2023-12-12', TRUE, 5, 4.9, 19),
(13, 9, 5, '2022-10-01', FALSE, 7, 3.5, 24),
(6, 7, 4, '2020-09-16', TRUE, 10, 4.4, 41),
(10, 8, 2, '2026-07-03', TRUE, 3, 5, 16),
(8, 2, 1, '2021-03-15', TRUE, 7, 4.6, 42),
(14, 3, 3, '2024-02-12', TRUE, 5, 4.6, 24),
(3, 2, 2, '2023-01-18', FALSE, 2, 3, 31), 
(14, 8, 4, '2022-04-24', TRUE, 9, 4.3, 14),
(16, 2, 5, '2020-12-28', FALSE, 9, 3.5, 27),
(2, 1, 1, '2025-01-14', FALSE, 4, 2, 15),
(8, 7, 2, '2024-06-03', TRUE, 5, 4.5, 26),
(4, 9, 4, '2026-10-09', TRUE, 8, 4.3, 17),
(11, 1, 1, '2023-10-16', FALSE, 3, 4, 24),
(11, 7, 4, '2025-12-27', FALSE, 3, 3.1, 15),
(5, 10, 5, '2022-02-28', TRUE, 8, 3.8, 35);