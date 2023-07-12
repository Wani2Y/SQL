-- see how row_number() ignores framing.
SELECT prod_id,
       price,
       category,
       count(prod_id) over(
            partition by category order by price
            range between current row and current row
       ) AS "framing in effect",
       row_number() over(
            partition by category order by price
            range between current row and current row
       ) AS "framing not in effect"
from products;