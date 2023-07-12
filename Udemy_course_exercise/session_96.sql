/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/
SELECT * 
FROM "public"."employees"
SELECT *, AGE(birth_date) AS "employee age"
FROM employees
WHERE (EXTRACT (YEAR FROM AGE(birth_date))) > 60;

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/
SELECT * 
FROM "public"."employees"
SELECT COUNT("emp_no")
FROM "public"."employees"
WHERE EXTRACT(MONTH FROM "hire_date") = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/
SELECT COUNT("emp_no")
FROM "public"."employees"
WHERE EXTRACT(MONTH FROM "birth_date") = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/
SELECT *
FROM "public"."employees"
JOIN(SELECT MAX(AGE(birth_date)) as "oldest age"
FROM "public"."employees") AS DT ON "oldest age" = AGE(birth_date);

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/
SELECT COUNT("orderid") AS "oders placed in 2004-01"
FROM orders
WHERE EXTRACT(YEAR FROM "orderdate") = 2004 AND EXTRACT(MONTH FROM "orderdate") = 1
# or 
WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01';