# Challenge: The wordiest author
# Select all authors who have written more than 1 million words using GROUP BY and HAVING.

SELECT author_name, SUM(words) AS total_words
FROM author_table
GROUP BY words
HAVING total_words>1000000;

# select all authors who write more than an average of 150,000 words per book.
SELECT author_name, ROUND(AVG(words),2) AS avg_words
FROM author_table
GROUP BY language
HAVING avg_words>150000;

