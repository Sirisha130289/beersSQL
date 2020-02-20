SELECT COUNT(*)
FROM beers;
SELECT COUNT(Image)
FROM beers;

SELECT MAX(Alcohol) AS maximum_alcohol
FROM beers;

SELECT MIN(Alcohol) AS minimum_alcohol
FROM beers;

SELECT SUM(Alcohol * 1.1) AS total_sum
FROM beers;

SELECT AVG(Alcohol) AS average, Name, BrewerId
FROM beers
GROUP BY BrewerId;

SELECT LEFT(Name, 1) AS first_letter, AVG(Alcohol) AS average
FROM beers
GROUP BY first_letter;

SELECT ROUND(Price,2)
FROM beers;

SELECT  MIN(Alcohol) AS minimum, BrewerId,MIN(Stock) AS stockminimum
FROM beers
GROUP BY BrewerId
HAVING stockminimum<5;

SELECT  BrewerId,AVG(Alcohol) AS average_alcohol
FROM beers
GROUP BY  BrewerId
HAVING count(*)>10;

SELECT  Name,
       Turnover*0.80 AS dollars,
       Turnover*0.96 AS smth_else
FROM brewers;
