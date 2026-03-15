-- Data cleaning

SELECT *
FROM layoffs;

-- STEPS IN DATA CLEANING
-- 1. Remove duplicates
-- 2. Standardize the data
-- 3. Null values or blanks values
-- 4. Remove irrelavent columns (Not necessary)

-- CREATING COPY OF RAW DATA
CREATE TABLE layoffs_stagging
LIKE layoffs;

SELECT *
FROM layoffs_stagging;

INSERT layoffs_stagging
SELECT *
FROM layoffs;

-- 1. Remove Duplicates

-- SELECT *,
-- ROW_NUMBER() OVER(partition by
-- company,industry,total_laid_off,percentage_laid_off,`date`) AS row_num
-- FROM layoffs_stagging

-- Finding Duplicate
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(partition by
company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_stagging
)
SELECT *
FROM duplicate_cte
WHERE row_num>1;

-- Checking results
SELECT *
FROM layoffs_stagging
WHERE company='Casper';

-- Removing copy of duplicate -> We cant directly delete like this

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(partition by
company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_stagging
)
DELETE
FROM duplicate_cte
WHERE row_num>1;

-- Creating another table to delete duplicate based on row_num

CREATE TABLE `layoffs_stagging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_stagging2;

INSERT INTO layoffs_stagging2
SELECT *,
ROW_NUMBER() OVER(partition by
company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_stagging;

SELECT *
FROM layoffs_stagging2
WHERE row_num>1;

DELETE 
FROM layoffs_stagging2
WHERE row_num>1;

SELECT *
FROM layoffs_stagging2;

-- 2. Standardizing the data
-- Finding issue and fixing it in data

-- 1. Remove extraspace

SELECT company,TRIM(company)
FROM layoffs_stagging2;

UPDATE layoffs_stagging2
SET company=TRIM(company);

SELECT DISTINCT industry
FROM layoffs_stagging2
ORDER BY 1;

SELECT *
FROM layoffs_stagging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_stagging2
SET industry='Crypto'
WHERE industry LIKE 'Crypto%';

-- SELECT *
-- FROM layoffs_stagging2
-- WHERE industry LIKE 'Crypto%';

SELECT DISTINCT industry
FROM layoffs_stagging2;

SELECT *
FROM layoffs_stagging2;

SELECT DISTINCT location
FROM layoffs_stagging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_stagging2
ORDER BY 1;

-- UPDATE layoffs_stagging2
-- SET country='United States'
-- WHERE country LIKE 'United States%';

-- SELECT DISTINCT country
-- FROM layoffs_stagging2
-- ORDER BY 1;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_stagging2
ORDER BY 1;

UPDATE layoffs_stagging2
SET country=TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';


SELECT *
FROM layoffs_stagging2;

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoffs_stagging2;

UPDATE layoffs_stagging2
SET `date`=STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoffs_stagging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_stagging2;

-- 3. Remove Null or white spaces
SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

UPDATE layoffs_stagging2
SET industry = NULL
WHERE industry='';

SELECT *
FROM layoffs_stagging2
WHERE industry IS NULL
OR industry='';

SELECT *
FROM layoffs_stagging2
WHERE company='Airbnb';

SELECT t1.industry,t2.industry
FROM layoffs_stagging2 AS t1
JOIN layoffs_stagging2 AS t2
	ON t1.company=t2.company
WHERE (t1.industry IS NULL or t1.industry ='')
AND t2.industry IS NOT NULL;

UPDATE layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company=t2.company
SET t1.industry=t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT industry
FROM layoffs_stagging2;

SELECT *
FROM layoffs_stagging2;

SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_stagging2;

ALTER TABLE layoffs_stagging2
DROP COLUMN row_num;




















