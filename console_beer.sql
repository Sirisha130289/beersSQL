SELECT Category
FROM categories;

SELECT Category
FROM categories
ORDER BY Category DESC;

SELECT Name
FROM brewers
WHERE Turnover>5000;

SELECT Name,City,Turnover
FROM brewers
WHERE Turnover<5000 AND Turnover!=0
ORDER BY Turnover;

SELECT DISTINCT Name,Alcohol
FROM beers
ORDER BY Alcohol DESC ;

SELECT DISTINCT Name
FROM beers
WHERE Name LIKE '%white%'
ORDER BY Name ASC;

SELECT DISTINCT Name,Alcohol
FROM beers
WHERE Alcohol BETWEEN 3 AND 7;

SELECT Name,Alcohol
FROM beers
ORDER BY Alcohol DESC
LIMIT 3 ;

SELECT Name,Address, CONCAT(ZipCode+City) AS City
FROM brewers;