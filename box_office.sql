# Challenge - Box Office Hits
# retrieve the table
SELECT *
FROM box_office_hits;

#select movies which are released only after 2010 and order by release year.
SELECT *
FROM box_office_hits
WHERE release_year >2010
ORDER BY release_year;


