/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/
SELECT *
FROM "public"."employees"
ORDER by "first_name" ASC, "last_name" DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/
SELECT *
FROM "public"."employees"
ORDER BY AGE("birth_date");

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/
SELECT *
FROM "public"."employees"
where "first_name" ILIKE 'k%'
ORDER BY "hire_date";