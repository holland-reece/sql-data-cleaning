# SQL Demo: Selection Statements

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Select all rows and cols
# NOTE: must end with a semicolon, like in Matlab
# NOTE: must first double-click database in LH panel so SQL knows where to find the table, OR include database name with "." and then table in cmd
# NOTE: if there are > 1000 rows, need to raise the limit in drop-down menu above (ex. "Limit to 5000 rows")
SELECT *
FROM Parks_and_Recreation.employee_demographics; # Indicate where to select rows from

# Select cols
SELECT first_name, last_name, birth_date # select cols by header names
FROM Parks_and_Recreation.employee_demographics;

# Calculations in select stmts: Add a col with ages + 10
SELECT first_name,
last_name,
birth_date,
age,
age + 10
FROM Parks_and_Recreation.employee_demographics;

# Calculations in select stmts: follows normal PEMDAS order of operations
SELECT first_name,
age,
POWER(age, 2) # exponent, raised values in age col to the power of 2
FROM Parks_and_Recreation.employee_demographics;

# Use DISTINCT to only select distinct values
# SELECT DISTINCT gender # only show Male and Female
SELECT DISTINCT first_name, gender # all first names are unique, so shows all values
FROM Parks_and_Recreation.employee_demographics;

