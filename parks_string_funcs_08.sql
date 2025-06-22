# SQL Demo: String Functions

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

-- Length --

SELECT LENGTH('skyfall'); # Return length of a string

# Select a column and return length of strings in that column
SELECT first_name, LENGTH(first_name)
FROM Parks_and_Recreation.employee_demographics
ORDER BY LENGTH(first_name)
;

-- Lower & Upper --
# change case
SELECT LOWER('sKyfAlL');
SELECT UPPER('sKyfAlL');

# Correct standardization issues in a column caused by case differences
SELECT first_name, UPPER(first_name)
FROM Parks_and_Recreation.employee_demographics
;

-- Trim, Left Trim, Right Trim --
SELECT TRIM('           skyfall           ');
SELECT LTRIM('           skyfall           ');
SELECT RTRIM('           skyfall           ');

-- Left and Right --

# Left
SELECT first_name, LEFT(first_name, 4) # return left 4 characters
FROM Parks_and_Recreation.employee_demographics
;

# Right
SELECT first_name, RIGHT(first_name, 4) # return right 4 characters
FROM Parks_and_Recreation.employee_demographics
;

-- Substrings --
# Could use this, for example, to return month that everyone was born
SELECT first_name, SUBSTRING(birth_date, 6, 2) AS birth_month # first int is start pos, second int is number of chars
FROM Parks_and_Recreation.employee_demographics
;

-- Replace --
SELECT first_name, REPLACE(first_name, 'a', 'z') # letter to replace, what to replace it with
FROM Parks_and_Recreation.employee_demographics
;

-- Locate --
SELECT LOCATE('l', 'Holland'); # char you want to find, string to search (returns first instance if multiple)

-- Concat --
SELECT first_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM Parks_and_Recreation.employee_demographics
;

