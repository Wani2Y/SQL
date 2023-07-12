-- find the customers who is not 55 years old
SELECT COUNT(customerid)
FROM "public"."customers"
WHERE NOT "age" = 55;