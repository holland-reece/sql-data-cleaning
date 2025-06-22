# SQL Demo: Notes on viewing tables and running lines in MySQL Workbench

# Holland Brown

# Updated: 2025-06-20
# Created: 2025-06-20

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Display a table
	# in LH panel, find a table in Tables drop-down menu and right-click it, then select "Limit 1000"
    # OR, can run a cmd like the following:
SELECT * FROM Parks_and_Recreation.employee_demographics;

# Expand bottom panel to view table selection

# Display a different table (execute one cmd at a time or run all to see both)
	# Run 1 cmd at a time: click 1 line, hit lightning bolt with an "I" to execute
    # Run all cmds: hit lightning bolt
SELECT * FROM Parks_and_Recreation.employee_salary;

# if you run all cmds, can view multiple tables by switching bottom tabs in bottom panel