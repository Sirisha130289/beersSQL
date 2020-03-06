#ToDO list
# Calculation of total minutes required to do all tasks specified in the todo list table.

SELECT SUM(estimated_minutes) AS total_minutes_required
FROM todo_list;