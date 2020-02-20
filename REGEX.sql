#contains
SELECT *
FROM beers
WHERE Name LIKE '%wit%'


#using REGEX
SELECT *
FROM beers
WHERE Name REGEXP 'wit';


#starts with
SELECT *
FROM beers
WHERE Name LIKE 'af%';

SELECT *
FROM beers
WHERE Name REGEXP '^af';

#ends with
SELECT *
FROM beers
WHERE Name LIKE '%se';

SELECT *
FROM beers
WHERE Name REGEXP 'se$';

#contains + OR
SELECT *
FROM beers
WHERE Name LIKE '%wit%'
OR Name LIKE '%af%';

SELECT *
FROM beers
WHERE Name REGEXP 'wit|af';

#more complex expression
SELECT *
FROM beers
WHERE Name LIKE 'a%'
OR Name LIKE '%c';

SELECT *
FROM beers
WHERE Name REGEXP '^a|c$';

#
SELECT *
FROM beers
WHERE Name REGEXP '[be]a';
#ba
#ea

SELECT *
FROM beers
WHERE Name REGEXP 'a[be]';
#ab
#ae

SELECT *
FROM beers
WHERE Name REGEXP '[c-h]a';
#ca,da,ea,fa,ga,ha