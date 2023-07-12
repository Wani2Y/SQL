/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/
SELECT COUNT(emp_no), hire_date
from "public"."employees"
GROUP BY hire_date;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/
SELECT COUNT(t.title), concat(e.first_name, ' ', e.last_name) AS "name" 
from "public"."employees" AS e
    INNER join "public"."titles" as t ON e.emp_no = t.emp_no
WHERE EXTRACT (YEAR FROM e.hire_date) > 1991
GROUP BY t.title, e.first_name, e.last_name;

/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/
SELECT concat(e.first_name, ' ', e.last_name) AS "name",
       dp.dept_name,
       d.from_date, d.to_date       
FROM "public"."employees" as e
    inner join "public"."dept_emp" as d on e.emp_no = d.emp_no
    inner join "public"."departments" as dp on d.dept_no = dp.dept_no
WHERE dp.dept_name = 'Development'
GROUP BY e.emp_no;