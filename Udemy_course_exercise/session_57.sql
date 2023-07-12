-- combine the first name and last name of employees
SELECT CONCAT(first_name, ' ', last_name) AS "Full Name" 
FROM "public"."employees";