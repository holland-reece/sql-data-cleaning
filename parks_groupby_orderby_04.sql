# SQL Demo: GROUP BY and ORDER BY

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

SELECT *
FROM Parks_and_Recreation.employee_demographics;

# Group by gender
# NOTE: different from using DISTINCT; allows us to later run aggregate functions on the groups
SELECT gender
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
;

# Perform AVG aggregate function on rows grouped by gender
# Returns avg age of males and females
SELECT gender, AVG(age)
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
;

# Select and group by multiple cols
# NOTE: selected cols must be same as group by cols
SELECT occupation, salary
FROM Parks_and_Recreation.employee_salary
GROUP BY occupation, salary
;

# Other aggregate functions
# COUNT returns number of rows in age col in each group
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
;

-- ORDER BY --
SELECT *
FROM Parks_and_Recreation.employee_demographics
# ORDER BY first_name # alphabetically order rows by first name
# ORDER BY first_name ASC # ascending order (default for text values)
ORDER BY first_name DESC # descending order
;

SELECT *
FROM Parks_and_Recreation.employee_demographics
# ORDER BY gender, age DESC # order by gender first, then age
ORDER BY 5, 4 DESC # Not recommended bc cols get added and removed, but can order by column number (same result)
;

-- Having vs Where --
SELECT gender, AVG(age)
FROM Parks_and_Recreation.employee_demographics
# WHERE AVG(age) > 40 # ERROR: aggregate functions run AFTER group-by line, so this line can't run
GROUP BY gender
HAVING AVG(age) > 40 # having is designed to filter group by results by aggregate functions AFTER grouping
;

SELECT occupation, AVG(salary)
FROM Parks_and_Recreation.employee_salary
WHERE occupation LIKE '%manager%' # filter at the row level
GROUP BY occupation 
HAVING AVG(salary) > 75000 # filter by aggregate function AFTER group-by line runs (must be after group-by)
;

