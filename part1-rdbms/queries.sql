sql
-- Q1 : Customers from Mumbai with total order value

SELECT c.customer_id, c.customer_name, SUM(o.total_amount) AS total_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;


sql
-- Q2: Top 3 products by quantity sold

SELECT p.product_name, SUM(oi.quantity) AS total_qty
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC
LIMIT 3;


sql
-- Q3: Sales reps and unique customers handled

SELECT rep_id, COUNT(DISTINCT customer_id) AS unique_customers
FROM orders
GROUP BY rep_id;


sql
-- Q4: Orders with value > 10,000

SELECT *
FROM orders
WHERE total_amount > 10000
ORDER BY total_amount DESC;


sql
-- Q5: Products never ordered

SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
