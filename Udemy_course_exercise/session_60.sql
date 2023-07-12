-- Question 1: What is the average salary for the company?
-- Table: Salaries
SELECT AVG(salary) AS "average salary"
FROM "public"."salaries";
-- $63810.744836143706


-- Question 2: What year was the youngest person born in the company?
-- Table: employees
SELECT MAX(birth_date) AS "Youngest age"
FROM "public"."employees";
-- 1965

-- Question 1: How many towns are there in france?
-- Table: Towns
SELECT COUNT(DISTINCT "name") AS "number of names of towns", COUNT(DISTINCT id) AS "number of ids"
FROM "public"."towns";
-- 33954

-- Question 1: How many official languages are there?
-- Table: countrylanguage
SELECT COUNT(DISTINCT "language") AS "number of official language"
FROM "public"."countrylanguage"
WHERE isofficial = TRUE;
-- 238

-- Question 2: What is the average life expectancy in the world?
-- Table: country
SELECT AVG(country.lifeexpectancy) AS "average world life expectancy"
FROM "public"."country";
-- 66.486036

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
SELECT AVG(population) AS "average population of the Netherlands"
FROM "public"."city"
WHERE countrycode = 'NLD';
-- 185001.75