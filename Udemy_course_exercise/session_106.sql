/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
SELECT od.*, cu.state
FROM "public"."orders" as od
    INNER JOIN "public"."customers" as cu
    ON od.customerid = cu.customerid
where cu.state = 'OH' or
      cu.state = 'NY' OR
      cu.state = 'OR';
-- or WHERE cu.state IN ('OH', 'NY', 'OR')

/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
SELECT p.prod_id, iv.quan_in_stock
FROM "public"."products" AS p
    INNER JOIN "public"."inventory" AS iv  
    ON p.prod_id = iv.prod_id;

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
SELECT concat(em.first_name, em.last_name) AS "name",
       dep.dept_name
FROM "public"."employees" AS em
    inner join "public"."dept_emp" AS d on em.emp_no = d.emp_no
    left join "public"."departments" as dep on d.dept_no = dep.dept_no;