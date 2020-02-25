SELECT CURDATE(),
       CURTIME(),
       DAYOFMONTH(NOW());

SELECT YEAR(NOW()),
       MONTH(NOW()),
       DAYOFMONTH(NOW()),
       HOUR(NOW()),
       MINUTE(NOW()),
       SECOND(NOW());

SELECT DAYNAME(NOW()),
       MONTHNAME(NOW()),
       EXTRACT(YEAR FROM NOW());

SELECT *
FROM orders
WHERE order_date >= '2019-01-01';

SELECT *
FROM orders
WHERE YEAR(order_date) >= YEAR('2019 - 01 - 01');

SELECT DATE_FORMAT(NOW(), '%d %m %y');
SELECT DATE_FORMAT(NOW(), '%D %M %Y');

SELECT TIME_FORMAT(NOW(), '%H:%i %p');

SELECT DATE_ADD(NOW(), INTERVAL -1 DAY);
SELECT DATE_SUB(NOW(), INTERVAL 1 DAY);

SELECT DATEDIFF('2020-02-25', '2020-02-20');

SELECT order_id,
       IFNULL(shipper_id, 'Not assigned') AS shippers
FROM orders;

SELECT order_id,
       COALESCE(shipper_id, comments, 'Not assigned') AS shippers
FROM orders;

SELECT CONCAT(first_name, SPACE(1), last_name) AS customer,
       IFNULL(phone, 'Unknown')                AS phone
FROM customers;

SELECT order_id,
       order_date,
       IF(YEAR(order_date) = YEAR(NOW()), 'Active', 'Archived') AS status
FROM orders;

SELECT customer_id,
       first_name,
       points,
       CASE
           WHEN points < 2000 THEN 'Bronze'
           WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
           WHEN points >= 3000 THEN 'Gold'
END AS customer_type
FROM customers;