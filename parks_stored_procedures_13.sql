# SQL Demo: Stored Procedures

# Holland Brown

# Updated: 2025-06-22
# Created: 2025-06-22

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Stored Procedures are like Python functions
# Allows you to store queries and call them multiple times in a script

# Create procedure
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

# Call procedure
CALL large_salaries();

# Example with multiple queries using a delimiter (';', '$$', '//' are delimeters)
DELIMITER $$
CREATE PROCEDURE large_sal2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END$$
DELIMITER ; # change delimiter back to semicolon

# Call procedure
CALL large_sal2();

# Using parameters in stored procedures (requires user input at call)
DELIMITER $$
CREATE PROCEDURE large_sal4(employee_id_param INT) # add parameter and its define datatype
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = employee_id_param; # return salary where employee ID is same as user input
END$$
DELIMITER ; # always change delimiter back to semicolon

CALL large_sal4(1); # return salary for employee with ID 1


