# SELF JOIN
Use sql_hr;
SELECT e.employee_id,
       e.job_title,
       m.first_name
FROM employees AS e
         INNER JOIN employees AS m on e.reports_to = m.employee_id;

#UNION
Use sql_store;
SELECT order_date, 'Active' AS status
FROM orders
WHERE order_date >= '2020-01-01'
UNION
SELECT order_date, 'Archived' AS status
FROM orders
WHERE order_date < '2020-01-01';

#write a query that includes the customer's ID, first name, points and type returns.
# Note that the column with the type does not exist in the customers table,
# so we have calculated the values ​in this column based on the points that every customer has.
# If they have less than 2000 points,
# their is type bronze, if they have between 2000 and 3000 points,
# they are silver and if they have more than 3000 points, their type is gold.
# Also sort the result by the first name

SELECT c.customer_id,
       c.first_name,
       c.points,
       'Bronze' AS type
FROM customers AS c
WHERE points < 2000
UNION
SELECT c.customer_id,
       c.first_name,
       c.points AS 'type',
       'Silver' AS type
FROM customers AS c
WHERE points BETWEEN 2000
          AND 3000
UNION
SELECT c.customer_id,
       c.first_name,
       c.points AS 'type',
       'Gold'   AS type
FROM customers AS c
WHERE points > 3000
ORDER BY first_name;

