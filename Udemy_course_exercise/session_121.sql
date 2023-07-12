-- we want a table showing employee names, their maximal salaries, their current salaries, and from date of their current salaries
SELECT DISTINCT(s.emp_no),
       concat(e.first_name, ' ', e.last_name) AS "full_name",
       last_value(s.from_date) OVER(
            partition by s.emp_no
            ORDER BY s.from_date
            RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ),
       last_value(s.salary) OVER(
            partition by s.emp_no
            ORDER BY s.from_date
            RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ),
       d.dept_name,
       MAX(s.salary) OVER(
            partition by s.emp_no
            ORDER BY s.from_date
            RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       )
FROM salaries as s
JOIN employees as e using(emp_no)
join dept_emp as de using(emp_no)
join departments as d using(dept_no)

ORDER BY s.emp_no ASC;