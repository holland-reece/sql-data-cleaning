# SQL Demo: Limit and Aliasing

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

SELECT *
FROM Parks_and_Recreation.employee_demographics;

# Limit to a number of rows
SELECT *
FROM Parks_and_Recreation.employee_demographics
LIMIT 3 # only take top 3 rows
;

# Combine LIMIT with ORDER BY
SELECT *
FROM Parks_and_Recreation.employee_demographics
ORDER BY age DESC
LIMIT 3 # now, taking top 3 rows returns the 3 oldest people
;

SELECT *
FROM Parks_and_Recreation.employee_demographics
ORDER BY age DESC
LIMIT 3, 1 # start at position 3 and take the next 1 row after it
;

-- Aliasing --

# Recall this example from group-by demo:
SELECT gender, AVG(age) # creates a column called 'AVG(age)', which we may not want
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

# Instead, use AS to alias (rename) the aggregate function
SELECT gender, AVG(age) AS avg_age
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;

# 'AS' is implied; don't need to include it
SELECT gender, AVG(age) avg_age # works same if alias is just after the function
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;