#

Use sql_store;
SELECT *
FROM products
WHERE unit_price > (
    SELECT unit_price
    FROM products
    WHERE product_id = 3
);

#Subquery select statement
Use sql_invoicing;
SELECT invoice_id,
       invoice_total,
       (SELECT AVG(invoice_total)
        FROM invoices)                                                        AS invoice_average,
       TRUNCATE(invoice_total - (SELECT AVG(invoice_total) FROM invoices), 2) AS difference
FROM invoices;

Use sql_hr;
SELECT *
FROM (SELECT client_id,
             name,
             (SELECT SUM(invoice_total)
              FROM invoices
              WHERE client_id = c.client_id) as total_sales
      FROM clients AS c) AS sales_summary
WHERE total_sales IS NOt NUll;

#SUBQUERIES

#● In our HR database, write a query to find all employees who are more than earn on average
SELECT employee_id, employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) AS avg_salary
                FROM employees
);

#● Search for customers without invoices (use NOT IN)
SELECT customer_id, first_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id
                          FROM orders
);

Use sql_invoicing;
SELECT client_id, name
FROM clients
WHERE client_id NOT IN (SELECT client_id
                        FROM invoices
);

#● Find customers who have ordered lettuce (ID = 3).
# Select in your Select statement the customer_id, first_name, last_name.
#We can solve this problem by including both the subquery and the join use.
# So as part of this exercise, I want you with both solutions and choose the one that is more readable.

Use sql_store;
SELECT customer_id, first_name,last_name
from customers
WHERE customer_id IN (SELECT customer_id
                      FROM orders
                      WHERE order_id IN (SELECT order_id
                                         FROM order_items
                                         WHERE product_id = 3));

#● write a query against the invoices table to generate this report
# Here we have 4 columns date_range, total_sales,total_payment,
# what_we_expect what the difference is between these 2 columns (2,3).
# In this table we have 3 records, we first see all amounts for the first half of 2019,
# then for the second half of 2019 and then followed by the total
 Use sql_invoicing;
SELECT 'First Half of 2019'               AS date_range,
       SUM(invoice_total)                 AS total_sales,
       SUM(payment_total)                 AS total_payments,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 'Second Half of 2019'              AS date_range,
       SUM(invoice_total)                 AS total_sales,
       SUM(payment_total)                 AS total_payments,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT 'Total'                            AS date_range,
       SUM(invoice_total)                 AS total_sales,
       SUM(payment_total)                 AS total_payments,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date NOT LIKE 2019;

#Extra
SELECT date, pm.name AS 'payment_method' , amount
FROM payments AS p
JOIN payment_methods AS pm
WHERE p.payment_method IN (SELECT pm.payment_method_id
                           FROM payment_methods
                          );