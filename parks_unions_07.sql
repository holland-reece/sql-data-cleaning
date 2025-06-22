# SQL Demo: Unions

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

SELECT *
FROM Parks_and_Recreation.employee_demographics;

SELECT *
FROM Parks_and_Recreation.employee_salary;

# Unions allow us to combine rows together
SELECT age, gender
FROM Parks_and_Recreation.employee_demographics
UNION
SELECT first_name, last_name
FROM Parks_and_Recreation.employee_salary
;

# UNION is the same as UNION DISTINCT by default; it removes duplicates
SELECT first_name, last_name
FROM Parks_and_Recreation.employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM Parks_and_Recreation.employee_salary
;

# If we want the duplicates, can use UNION ALL
SELECT first_name, last_name
FROM Parks_and_Recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM Parks_and_Recreation.employee_salary
;

# Use case: Parks Dept wants to get rid of old and highly paid employees
SELECT first_name, last_name, 'Old Man' AS Label # old ppl from dem table
FROM Parks_and_Recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label # old ppl from dem table
FROM Parks_and_Recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid' AS Label # expensive ppl from sal table
FROM Parks_and_Recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name # order by name to see ppl who meet multiple conditions
;


