-- Task 6: Sales Trend Analysis using SQL
-- Dataset: superstore_orders (order_id, order_date, sales)

-- Create Table
CREATE TABLE superstore_orders (
    order_id VARCHAR(20),
    order_date DATE,
    sales DECIMAL(10,2)
);

-- Sample Data
INSERT INTO superstore_orders VALUES
('CA-2019-1001', '2019-01-03', 250.50),
('CA-2019-1002', '2019-01-10', 400.00),
('CA-2019-1003', '2019-02-15', 300.25),
('CA-2019-1004', '2019-02-20', 520.00),
('CA-2019-1005', '2019-03-12', 180.00),
('CA-2019-1006', '2019-03-30', 260.00);

-- Query 1: Monthly Revenue and Order Volume
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    superstore_orders
GROUP BY
    YEAR(order_date), MONTH(order_date)
ORDER BY
    year, month;

-- Query 2: Top 3 Months by Revenue
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS total_revenue
FROM
    superstore_orders
GROUP BY
    YEAR(order_date), MONTH(order_date)
ORDER BY
    total_revenue DESC
LIMIT 3;

-- Query 3: 2019 Monthly Trend
SELECT
    MONTH(order_date) AS month,
    SUM(sales) AS monthly_sales
FROM
    superstore_orders
WHERE
    YEAR(order_date) = 2019
GROUP BY
    MONTH(order_date)
ORDER BY
    month;

-- Query 4: Sales Between Jan to March
SELECT
    MONTH(order_date) AS month,
    SUM(sales) AS total_sales
FROM
    superstore_orders
WHERE
    MONTH(order_date) BETWEEN 1 AND 3
GROUP BY
    MONTH(order_date)
ORDER BY
    month;
