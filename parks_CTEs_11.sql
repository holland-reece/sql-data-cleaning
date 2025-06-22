# SQL Demo: CTEs (Common Table Expressions)

# Holland Brown

# Updated: 2025-06-22
# Created: 2025-06-22

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# CTEs allow us to define a subquery expression as a block we can reference later in the code
# NOTE: easier to follow than subqueries
# NOTE: However, CTEs can only be used immediately after (not a permanent object like a temp table)

-- CTE Definition Syntax --
WITH CTE_example AS
(
SELECT gender, AVG(salary) AS avg_sal, MIN(salary) min_sal, MAX(salary) max_sal, COUNT(salary) ct
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal) # Then, can refer to the CTE to do a calculation on it
FROM CTE_example;

# Compare with a subquery, which is harder to read and keep track of for multi-step calculations
SELECT AVG(avg_sal) # do the same calculation as above (avg of the gender-based salary avgs)
FROM(SELECT gender, AVG(salary) AS avg_sal, MIN(salary) min_sal, MAX(salary) max_sal, COUNT(salary) ct
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) Subquery_example
;

# Joining queries together with nested CTEs
WITH CTE_birthdate AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
),
CTE_salary AS
(
SELECT employee_id, salary
FROM employee_salary as sal
WHERE salary > 50000
)
SELECT *
FROM CTE_birthdate
JOIN CTE_salary
	ON CTE_birthdate.employee_id = CTE_salary.employee_id # Allows us to join together 2 CTEs
;

# CTEs allow us to alias columns in the first line, which overwrite other aliases
WITH CTE_example2 (Gender, Avg_sal, Min_sal, Max_sal, Ct_sal) AS
(
SELECT gender, AVG(salary) AS avg_sal, MIN(salary) min_sal, MAX(salary) max_sal, COUNT(salary) ct
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_example2;