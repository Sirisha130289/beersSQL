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

SELECT DATE_FORMAT(NOW(),'%d %m %y');
SELECT DATE_FORMAT(NOW(),'%D %M %Y');