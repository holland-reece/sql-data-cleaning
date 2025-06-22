# SQL Demo: Subqueries

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Subquery inside a WHEN clause

# Return employee demographic info for those who are in both sal and dem tables, and dept ID from sal table = 1
SELECT *
FROM employee_demographics
WHERE employee_id IN
					(SELECT employee_id
						FROM employee_salary
                        WHERE dept_id = 1)
;

-- Subquery in a SELECT stmt --
 
SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
;

-- Subquery in a FROM stmt --
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

# SELECT AVG(`MAX(age)`) # use backticks so it knows this is a col name
SELECT AVG(max_age)
FROM
(SELECT gender,
AVG(age),
MAX(age) AS max_age,
MIN(age),
COUNT(age)
FROM employee_demographics
GROUP BY gender) AS aggregated_table
;
