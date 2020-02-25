#Challenge- karoke songs list

# Select for the first step all titles of the numbers.
SELECT song_title
FROM karoke_list_of_songs;

# Display the songs only with the mood"Pop" and year of release greater than 1990
SELECT song_title
FROM karoke_list_of_songs
WHERE mood LIKE 'pop'
AND year > 1990;

# Display the songs only with the mood"Pop" and year of release greater than 1990 and duration less than 4 minutes
SELECT song_title, (duration/60) AS minutes
FROM karoke_list_of_songs
WHERE mood LIKE 'pop'
AND year > 1990
AND (duration/60)<4;






