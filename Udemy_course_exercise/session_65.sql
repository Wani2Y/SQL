-- find the number of female customers from Oregon or New York
SELECT COUNT(customerid)
FROM "public"."customers"
WHERE "gender" = 'F' AND "state" = 'OR' OR "gender" = 'F' AND "state" = 'NY';

-- a more concise version
SELECT COUNT(customerid)
FROM "public"."customers"
WHERE ("gender" = 'F' AND "state" = 'OR') OR "gender" = 'F';