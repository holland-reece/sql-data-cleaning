# SQL Demo: Temporary Tables

# Holland Brown

# Updated: 2025-06-22
# Created: 2025-06-22

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Temp Tables are like CTEs that are permanent objects, i.e. stored, nut they're only stored for one session
# NOTE: Temp tables are used for more advanced data manipulation than CTE, like with Stored Procedures

-- Temp Table Definition Syntax --

# First method of creating a temp table: create empty table and insert data
CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
fav_movie varchar (50)
);

INSERT INTO temp_table
VALUES('Leslie', 'Knope', 'Election');

SELECT *
FROM temp_table;

# Second method (most common): create temp table from subset of our data
SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE sal_over_50k
(
SELECT *
FROM employee_salary
WHERE salary >= 50000
);

SELECT *
FROM sal_over_50k;