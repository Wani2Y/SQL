-- show employees older than the average age
SELECT emp_no,
       concat(first_name, ' ', last_name) AS "full_name",
       AGE(birth_date),
FROM employees
WHERE AGE(birth_date) > (
    SELECT AVG(AGE(birth_date)) AS "average_age"
    FROM employees
);

-- show title by salary for each employee
SELECT
	emp_no,
	(SELECT concat(first_name, ' ', last_name) AS "full_name"
	from employees AS e
	WHERE e.emp_no = s.emp_no),
	salary,
	(SELECT title 
	FROM titles AS t 
	WHERE t.emp_no = s.emp_no AND t.from_date = s.from_date + interval '2 days' OR t.from_date = s.from_date)
FROM salaries AS s
ORDER BY emp_no;