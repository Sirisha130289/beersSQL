
(A) Provide a list of all beer categories. (38) 
SELECT *
FROM categories;

(B) View the list of categories in descending alphabetical order without 
category IDs. (38)
SELECT Category
FROM categories
ORDER BY Category DESC;

(C) See a list of all breweries have over 5000 Euros turnover. (54) 
SELECT Name
FROM brewers
WHERE Turnover>5000;

(D) Now show only the name and city of the breweries that are less than 5000 Euro 
turnover, but not 0. Sort the list on the basis of turnover. (53) 
SELECT Name,City,Turnover
FROM brewers
WHERE Turnover<5000 AND Turnover!=0
ORDER BY Turnover;

(E) Provide a list of all possible alcohol content in beers table. So no 
doubles. And sorted from largest to smallest. (14) 
SELECT DISTINCT Name,Alcohol
FROM beers
ORDER BY Alcohol DESC ;

(F) Show the names of beers whose name contains "white" without doubles, 
sorted alphabetically. (30)
SELECT DISTINCT Name
FROM beers
WHERE Name LIKE '%white%'
ORDER BY Name ASC;

(G) Display all beers with more alcohol than 3 and less than 7 without using 
of logical operators (<,>, ...), (568) 
SELECT DISTINCT Name,Alcohol
FROM beers
WHERE Alcohol BETWEEN 3 AND 7;

(H) enter the top three of the strongest beers in our database. (3) 
SELECT Name,Alcohol
FROM beers
ORDER BY Alcohol DESC
LIMIT 3 ;

(I) By Thinker: Make a list of the name, street, city and zip code for all 
brewers in 3 columns for a list of addresses. Ie combine the postal code and the city in one column. 
SELECT Name,Address, CONCAT(ZipCode+City) AS City
FROM brewers;