# SQL Demo: Data Cleaning with 'World Layoffs' Data

# Holland Brown

# Updated: 2025-06-22
# Created: 2025-06-22

# Description:
	# Learning SQL code from YouTube series and GitHub resources
    
# Ref: https://github.com/AlexTheAnalyst/MySQL-YouTube-Series
# ---------------------------------------------------------------------

# Create a database, then upload world layoffs data from CSV file
SELECT *
FROM world_layoffs.layoffs; # RAW data (don't edit this)

# STEP 1: remove duplicates
# STEP 2: Standardize data
# STEP 3: NULL values and blank values
# STEP 4: Remove unnecessary cols

# Create duplicate "staging database" so we don't edit the raw data
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

# STEP 1: remove duplicates
# First, use ROW_NUMBER to only show unique data
SELECT *
FROM layoffs_staging;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`
) AS row_num # use backticks for date bc it is a SQL keyword
FROM layoffs_staging;

# Create CTE containing query above and filter for row_num > 1
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location,
industry, total_laid_off, percentage_laid_off, `date`
) AS row_num # use backticks for date bc it is a SQL keyword
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1; # if row number is > 1, there may be duplicates

# Look at duplicate rows in output and inspect individual cases to see if they are actually duplicates
SELECT *
FROM layoffs_staging
WHERE company = 'Oda';

