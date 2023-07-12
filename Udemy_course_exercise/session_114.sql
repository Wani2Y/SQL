/*
*  Calculate the total amount of employees per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/
SELECT dp.dept_name, e.emp_no, COUNT(e.emp_no) 
FROM employees AS e
    inner join dept_emp AS d on e.emp_no = d.emp_no
    INNer join "public"."departments" AS dp ON d.dept_no = dp.dept_no  
GROUP BY
    GROUPING SETS(
    (dp.dept_name),
    (e.emp_no)
    );


/*
*  Calculate the total average salary per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/
SELECT dp.dept_name, avg(s.salary)
FROM employees AS e
    inner join dept_emp AS d on e.emp_no = d.emp_no
    INNer join "public"."departments" AS dp ON d.dept_no = dp.dept_no  
    inner join "public"."salaries" AS s ON e.emp_no = s.emp_no 
GROUP BY
    GROUPING SETS(
    (dp.dept_name),
    ()
    );
