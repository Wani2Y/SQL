/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/
SELECT prod_id,
       title,
       NULLif(special, 0) as "special product"
from products;