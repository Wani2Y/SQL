-- how many raises does employee 10001 has?
SELECT COUNT(DISTINCT salary) AS "number of raises"
FROM "public"."salaries"
WHERE emp_no = 10001;

-- what job title does employee 10006 has?
SELECT *
FROM "public"."titles"
WHERE emp_no = 10006;