# SQL Demo: Joins

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

# JOIN allows you to join two tables together
# NOTE: the two tables we have here have the same employee_id column

-- Inner Join --
# returns rows that are the same in both columns in both tables

SELECT *
FROM Parks_and_Recreation.employee_demographics
# INNER JOIN Parks_and_Recreation.employee_salary # more explicit way of writing the same thing
JOIN Parks_and_Recreation.employee_salary # JOIN implies an Inner Join already
	ON employee_demographics.employee_id = employee_salary.employee_id # indicate columns we intend to join based on
    # NOTE: excludes row 2 bc there is an employee_id 2 in one table, but not the other
;

# Use aliasing to simplify this
SELECT *
FROM Parks_and_Recreation.employee_demographics AS dem
JOIN Parks_and_Recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# Select cols while joining
# Must specify which employee_id col to use in SELECT
SELECT dem.employee_id, age, occupation
FROM Parks_and_Recreation.employee_demographics AS dem
JOIN Parks_and_Recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Outer Join --
# There are Left and Right Outer Joins

# Left Outer Join: Uses first (left) listed table as reference (here, dem)
SELECT *
FROM Parks_and_Recreation.employee_demographics AS dem
LEFT JOIN Parks_and_Recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

# Right Outer Join: Uses second (right) listed table as reference (here, dem)
# If there is not a match for something in the right table to the left, there will be NULLs
# Here, there are NULLs in row 2 bc the sal table (right) has a row 2 but the dem table (left) does not
SELECT *
FROM Parks_and_Recreation.employee_demographics AS dem
RIGHT JOIN Parks_and_Recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Self Join --
# Tie the table to itself

# Example: assign people in the Parks & Rec dept to each other for Secret Santa
SELECT *
FROM Parks_and_Recreation.employee_salary AS emp1
JOIN Parks_and_Recreation.employee_salary AS emp2 # Self-join using aliases, bc the tables are the same
	ON emp1.employee_id + 1 = emp2.employee_id # assign each employee ID with the next ID in the list
;

# Clean up this code and the output by selecting cols and aliasing
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS santa_first_name,
emp1.last_name AS santa_last_name,
emp2.employee_id AS employee,
emp2.first_name AS emp_first_name,
emp2.last_name AS emp_last_name
FROM Parks_and_Recreation.employee_salary AS emp1
JOIN Parks_and_Recreation.employee_salary AS emp2 # Self-join using aliases, bc the tables are the same
	ON emp1.employee_id + 1 = emp2.employee_id # assign each employee ID with the next ID in the list
;

-- Joining Multiple Tables Together --

# this table is combined dem and sal info; has department numbers in dept_id col (from sal table)
SELECT *
FROM Parks_and_Recreation.employee_demographics AS dem
JOIN Parks_and_Recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT *
FROM parks_departments; # this is a reference table; contains department_id numbers

# Join the dem, sal, and parks_departments tables together
SELECT *
FROM Parks_and_Recreation.employee_demographics AS dem
INNER JOIN Parks_and_Recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd # alias as 'pd'
	ON sal.dept_id = pd.department_id
;
