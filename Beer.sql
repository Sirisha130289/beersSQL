
#(A) Provide a list of all beer categories. (38) 
SELECT *
FROM categories;

#(B) View the list of categories in descending alphabetical order without 
category IDs. (38)
SELECT Category
FROM categories
ORDER BY Category DESC;

#(C) See a list of all breweries have over 5000 Euros turnover. (54) 
SELECT Name
FROM brewers
WHERE Turnover>5000;

#(D) Now show only the name and city of the breweries that are less than 5000 Euro 
turnover, but not 0. Sort the list on the basis of turnover. (53) 
SELECT Name,City,Turnover
FROM brewers
WHERE Turnover<5000 AND Turnover!=0
ORDER BY Turnover;

#(E) Provide a list of all possible alcohol content in beers table. So no 
doubles. And sorted from largest to smallest. (14) 
SELECT DISTINCT Name,Alcohol
FROM beers
ORDER BY Alcohol DESC ;

#(F) Show the names of beers whose name contains "white" without doubles, 
sorted alphabetically. (30)
SELECT DISTINCT Name
FROM beers
WHERE Name LIKE '%wit%'
ORDER BY Name ASC;

#(G) Display all beers with more alcohol than 3 and less than 7 without using 
of logical operators (<,>, ...), (568) 
SELECT DISTINCT Name,Alcohol
FROM beers
WHERE Alcohol BETWEEN 3 AND 7;

#(H) enter the top three of the strongest beers in our database. (3) 
SELECT Name,Alcohol
FROM beers
ORDER BY Alcohol DESC
LIMIT 3 ;

#(I) make a list of the name, street, city and zip code for all brewers in 3 columns for a list of addresses. Ie combine the postal code and the city in one column. 
SELECT Name,Address, CONCAT(ZipCode,SPACE(1),City) AS City
FROM brewers;

# Exercise SELECT Part 2  
#(A) How many brewers are there in the database? (118) 

SELECT COUNT(Name) AS total_brewers
FROM brewers;

#(B) Calculate the average turnover of all brewers.  (114302.1525) 
SELECT AVG(Turnover) AS average_turnover
FROM brewers;

#(C) Give the lowest, medium and highest alcohol content of the beers in Table 1 instruction. (0,5.8706, 15) 

SELECT MIN(Alcohol) AS minimum ,MAX(Alcohol) AS maximum, TRUNCATE(AVG(Alcohol),4) AS medium
FROM beers;

#(D) Calculate the average turnover of all brewers in the province of Brabant 
# (Postal codes beginning with 1) but ignore the brewery 'Palm'. (39525.7143) 
#1
SELECT AVG(Turnover) AS avg_turnover_brabant
FROM brewers
WHERE ZipCode LIKE '1%'
AND Name NOT LIKE 'Palm';
#2
SELECT AVG(Turnover) AS avg_turnover_brabant
FROM brewers
WHERE LEFT(ZipCode,1) =1
AND Name NOT LIKE 'Palm';

#(E) Calculate the average alcohol by category (ID). (39 records) 
SELECT AVG(Alcohol)AS avg_alochol,CategoryId
FROM beers
GROUP BY CategoryId;

#(F) Show the highest price per beer category but ignore all the beers that are not in stock to be.
# Sort the results by CategoryID. Also make sure that we only see prices higher than 3. (5 records) 

SELECT MAX(Price) AS max_price,CategoryId,Stock
FROM beers
WHERE Stock<>0
GROUP BY CategoryId
HAVING max_price>3;
