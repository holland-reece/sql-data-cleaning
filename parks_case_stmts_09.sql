# SQL Demo: Case Statements

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age > 50 THEN "On Death's Door"
END
FROM employee_demographics
;

# Example: Departmental Raises
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary >= 50000 THEN salary + (salary * 0.07)
END AS New_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END AS 'Bonus'
FROM employee_salary
;

SELECT *
FROM employee_salary
