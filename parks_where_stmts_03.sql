# SQL Demo: Use WHERE clause to select rows that fulfill a condition

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Select rows where first name is equal to Leslie
# NOTE: "equal to" in SQL is just one "="
SELECT *
FROM Parks_and_Recreation.employee_salary
WHERE first_name = 'Leslie' # Boole
;

# Select rows where salary is greater than 50,000
SELECT *
FROM Parks_and_Recreation.employee_salary
# WHERE salary > 50000 # greater than
WHERE salary >= 50000 # greater than or equal to
;

# Boolean != (not equal to)
SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE gender != 'Female' # return non-female employees
;

# Combine multiple conditions: AND
SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE gender != 'Female'
AND birth_date > '1985-01-01' # non-female AND birthday is after 1985
;

# Combine multiple conditions: OR
SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE gender != 'Female'
OR birth_date > '1985-01-01' # only 1 condition must be true
;

# Combine multiple conditions: AND and OR
SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

# LIKE statement with "%" and "_"
SELECT *
FROM Parks_and_Recreation.employee_demographics
# WHERE first_name LIKE 'Les%' # % acts as wildcard
# WHERE first_name LIKE '%esl%' # search for just contains 'esl'
# WHERE first_name LIKE 'a%' # Not case sensitive! returns anyone whose name begins with 'A'
# WHERE first_name LIKE 'a__' # 2 underscores to specify starts with 'A' and has exacty 2 other characters
# WHERE first_name LIKE 'a___' # 3 underscores to specify starts with 'A' and has exacty 3 other characters
WHERE first_name LIKE 'a___%' # combine: starts with 'A', has 3 characters, can have anything after that (can't have < 3 chars after 'A')
;