/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/
SELECT DISTINCT("title") 
FROM "public"."titles";

/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/
SELECT COUNT(DISTINCT("birth_date")) AS "number of unique birth date"
FROM "public"."employees";

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/
SELECT DISTINCT("lifeexpectancy") AS "availble lifeexpectancy"
FROM "public"."country"
WHERE "lifeexpectancy" IS NOT NULL;