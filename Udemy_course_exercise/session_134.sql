/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/
create view "90-95" AS
SELECT emp_no,
       concat(first_name, ' ', last_name) AS "full_name"
from employees
where EXTRACT (YEAR FROM hire_date) >= 1990 AND
      EXTRACT (YEAR FROM hire_date) <= 1995;


/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/
SELECT *
from "bigbucks"
where highest_salary > 80000

CREATE VIEW "bigbucks" AS
SELECT distinct(e.emp_no),
       max(s.salary) over(
       partition by s.emp_no) AS "highest_salary",
       concat(first_name, ' ', last_name) as "full_name"
from employees as e
inner join salaries as s on e.emp_no = s.emp_no
order by e.emp_no;

-- correct answer
CREATE VIEW "bigbucks" AS
SELECT e.emp_no, s.salary
FROM employees as e
JOIN salaries as s USING(emp_no)
WHERE s.salary > 80000
ORDER BY s.salary;