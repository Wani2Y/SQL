/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
SELECT o.orderid,
       c.state,
       o.orderdate,
       o.netamount
FROM orders as o,
    (SELECT state
     from customers) AS c   
WHERE c.state in ('OH', 'NY', 'OR');

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
SELECT DISTINCT(concat(e.first_name, ' ', e.last_name)) as "full_name"
from employees as e,
     (SELECT emp_no, title
      from titles) as t
WHERE t.emp_no = 110183
order by full_name;