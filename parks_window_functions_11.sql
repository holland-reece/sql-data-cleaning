# SQL Demo: Window Functions

# Holland Brown

# Updated: 2025-06-22
# Created: 2025-06-22

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Compare window func with this Group-by example...
# NOTE: Group-by shows avg salary in just one row per group
SELECT gender, AVG(salary) AS avg_sal
FROM employee_demographics dem # aliasing
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

# Now the window func version...
# NOTE: shows avg salary for each group but formats output with a row for each employee
SELECT gender, AVG(salary) OVER() AS avg_sal # uses "OVER()"
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Now, use window func with PARTITION BY to make output more like group-by
# NOTE: allows us to add other columns without changing the grouped col
SELECT dem.first_name, gender, AVG(salary) OVER(PARTITION BY gender) AS avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Further example: using window func to display total sum of salaries by group
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender) AS avg_sal,
SUM(salary) OVER(PARTITION BY gender) AS sum_sal # include col with total salaries by gender
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Calculate Rolling Totals Using Window Functions --
# NOTE: A rolling total shows the sum of the previous rows and each subsequent row based on your partition

# Using window functions to calculate a rolling total
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender) AS avg_sal,
SUM(salary) OVER(PARTITION BY gender) AS sum_sal,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total # Calculate rolling total using ORDER BY
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Looking at Row Number, Rank and Dense Rank Using Window Functions --
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER() AS row_nbr # create row numbers that do not repeat
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Row numbers based on partition (row numbers are only unique within the partition)
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender) AS row_nbr # create row numbers based on partition
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Create row numbers based on a partition + ordered by salary highest to lowest
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_nbr # create row numbers
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Compare previous row numbers with RANK: rank only assigns unique indices to unique values
# NOTE: see in this example that there are two rank 5 rows in the male group bc two ppl are paid the same
# NOTE: After assigning same rank to duplicate rows, RANK assigns next rank based on position (ex. 1, 2, 2, 2, 5)
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_nbr,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_nbr # use same window funcs with RANK
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Now compare row numbers and rank with dense rank
# NOTE: dense rank is different from rank bc it assigns the next number after duplicates numerically, not positionally (ex. 1, 2, 2, 2, 3)
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_nbr,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_nbr,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_nbr
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;