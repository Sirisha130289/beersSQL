#Inner Join
#For the exercise I want you to look at the order_items table.
#In this table we have these columns: order_id, product_id, quantity and unit_price.
#I want you to write a query and this table with the products table, so for
# every order returns both the product id and the name.
# Followed by the quantity and unit price from the order_items table, and make sure for that matter that you use an alias to simplify your code.
USE sql_store;
SELECT *
FROM order_items AS oi
         JOIN products AS p
              ON oi.product_id = p.product_id;

SELECT o.order_id,
       first_name,
       last_name,
       c.customer_id
FROM orders AS o
         JOIN customers c on o.customer_id = c.customer_id;

SELECT c.customer_id, c.first_name, o.customer_id
FROM customers AS c
         LEFT JOIN orders o on c.customer_id = o.customer_id;

SELECT c.customer_id, c.first_name, o.customer_id
FROM customers AS c
         LEFT JOIN orders o USING (customer_id);

SELECT c.customer_id, c.first_name, o.customer_id
FROM customers AS c
         RIGHT JOIN orders o USING (customer_id);


SELECT oi.quantity                                    AS oder_quantity,
       oi.product_id,
       oi.order_id,
       oi.unit_price,
       p.unit_price,
       p.unit_price * oi.quantity                     AS current_price,
       (oi.unit_price - (p.unit_price * oi.quantity)) AS difference
FROM order_items AS oi
         JOIN products AS p
              ON oi.product_id = p.product_id;



#Multiple Tables Take a look at the sql_invoicing database
# Here we have these payments table, and these are payments made by every customer to a specific invoice.
# View the data and the columns that the payments table has.
# We can also combine this table with the payment_methods table,
# so just look at the data and the columns.
# Back to the payments table, I want you to write a query and you have this table
# adds with the payment_methods table and the clients table.
# Create a report that shows more details such as the customer's name and the method of payment...
USE sql_invoicing;

SELECT date, c.name, pm.name
FROM payments AS p
         JOIN payment_methods pm on p.payment_method = pm.payment_method_id
         JOIN clients c on p.client_id = c.client_id;


#OUTER JOIN
#Write a query that produces this result.
# So we have 3 columns here, product_id, name, quantity that I get from the order_items table.
# So here we have to merge the products table with order_items table,
# so that we can see how many times each product has been ordered.
# However, if we do an inner join, we will only see the products that are
# ordered, but here I do an outer join, so go ahead and write a query to produce this result.

SELECT oi.product_id, p.name, oi.quantity, o.customer_id
FROM products AS p

         JOIN order_items oi on p.product_id = oi.product_id

         LEFT OUTER JOIN orders o on o.order_id = oi.order_id;


SELECT p.product_id,p.name,SUM(o.quantity)AS total_sum
FROM order_items AS o
LEFT OUTER JOIN products p USING (product_id)
GROUP BY p.product_id,p.name
ORDER BY product_id;

# first_name(customer). customer_id(orders),name(shipper)
SELECT c.first_name,o.customer_id,s.name
FROM customers AS c
LEFT JOIN orders AS o USING(customer_id)
LEFT JOIN shippers AS s USING(shipper_id);
