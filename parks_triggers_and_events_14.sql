# SQL Demo: Triggers and Events

# Holland Brown

# Updated: 2025-06-22
# Created: 2025-06-22

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# An event is a block of code that runs when a trigger happens in a table

SELECT *
FROM employee_demographics dem;

SELECT *
FROM employee_salary sal;

-- TRIGGERS --

# Trigger Syntax
# If new employee data is inserted into salary table, insert new employee info into demographics table
DELIMITER $$
CREATE TRIGGER employee_insert # name trigger
	AFTER INSERT ON employee_salary # trigger event (if this happens, run the Event)
	FOR EACH ROW
BEGIN # This executes if above triggering event happens
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name); # use NEW or OLD to only refer to new inserted data or only old data
END $$
DELIMITER ;

# Test: trigger by inserting data into salary table
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'John Ralphio', 'Saperstein', 'Entertainment 720 CEO', '1000000', NULL);

SELECT *
FROM employee_salary sal; # can see data we inserted manually for John Ralphio

SELECT *
FROM employee_demographics dem; # can see that new row was inserted automatically for John Ralphio

-- EVENTS --
# Scheduled automator, rather than something triggered by some event

SELECT *
FROM employee_demographics;

# Example: check every 30 seconds for employees who are over 60, then delete them from employee demographics
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE # delete instead of select
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SELECT *
FROM employee_demographics;

SHOW VARIABLES LIKE 'event%'; # should be ON to be able to set events
