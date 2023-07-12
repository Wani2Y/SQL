/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
SELECT concat(e.first_name, e.last_name) AS "name", t.title
FROM "public"."employees" AS e
      INNER JOIN "public"."titles" as t ON e.emp_no = t.emp_no
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY e.first_name, e.last_name, t.title
HAVING COUNT(t.title) > 2;

/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
SELECT concat(e.first_name, ' ', e.last_name) AS "name", count(s.salary) as "number of salary changes"
FROM "public"."employees" AS e
     inner join "public"."salaries" as s on e.emp_no = s.emp_no
     INNER JOIN "public"."dept_emp" AS d on e.emp_no = d.emp_no
     inner join "public"."departments" as dp on dp.dept_no = d.dept_no
WHERE dp.dept_name = 'Development'
GROUP BY e.first_name, e.last_name
HAVING count(s.salary) > 15;

/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
SELECT concat(e.first_name, ' ', e.last_name) AS "name", count(d.emp_no)
FROM "public"."employees" as e
     RIGHT JOIN "public"."dept_emp" AS d on e.emp_no = d.emp_no
GROUP by d.emp_no, e.first_name, e.last_name
HAVING count(d.emp_no) > 1;