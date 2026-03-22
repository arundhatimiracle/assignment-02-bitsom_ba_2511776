
sql id="uazpjm"
-- Q1: Customers with total number of orders

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


sql id="rg6q0u"
-- Q2 Top 3 customers by total order value
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;


sql id="s2c46a"
-- Q3 Products purchased by customers from Bangalore
SELECT DISTINCT 
    p.product_name
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') p
ON o.product_id = p.product_id
WHERE c.city = 'Bangalore';


sql id="y0rczn"
-- Q4 Join all three files
SELECT 
    c.customer_name,
    o.order_date,
    p.product_name,
    o.num_items AS quantity
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') p
ON o.product_id = p.product_id;
