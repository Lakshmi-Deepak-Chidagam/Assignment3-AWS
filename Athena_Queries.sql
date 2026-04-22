-- ================================
-- QUERY 1: Total Sales by Customer
-- ================================
SELECT 
    customer,
    SUM(amount) AS total_sales
FROM processed
GROUP BY customer
ORDER BY total_sales DESC;

-- ================================
-- QUERY 2: Monthly Orders & Revenue
-- ================================
SELECT 
    DATE_FORMAT(CAST(orderdate AS DATE), '%Y-%m') AS month,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_revenue
FROM processed
GROUP BY DATE_FORMAT(CAST(orderdate AS DATE), '%Y-%m')
ORDER BY month;

-- ================================
-- QUERY 3: Order Status Dashboard
-- ================================
SELECT 
    status,
    COUNT(*) AS total_orders
FROM processed
GROUP BY status
ORDER BY total_orders DESC;

-- ================================
-- QUERY 4: Average Order Value
-- ================================
SELECT 
    customer,
    AVG(amount) AS avg_order_value
FROM processed
GROUP BY customer
ORDER BY avg_order_value DESC;

-- ================================
-- QUERY 5: Top 10 Orders (Feb 2025)
-- ================================
SELECT *
FROM processed
WHERE DATE_FORMAT(CAST(orderdate AS DATE), '%Y-%m') = '2025-02'
ORDER BY amount DESC
LIMIT 10;