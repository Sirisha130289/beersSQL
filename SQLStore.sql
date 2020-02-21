SELECT *
FROM orders AS o
INNER JOIN customers AS c
ON o.customer_id=c.customer_id;

SELECT o.order_id,
       first_name,last_name,
       c.customer_id
FROM orders AS o
JOIN customers c on o.customer_id = c.customer_id;