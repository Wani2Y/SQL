-- how much cumulatively a customer has ordered at out store
SELECT c.customerid,
       o.netamount,
       sum(o.netamount) OVER (
       partition by o.customerid
       order by o.orderid) AS "cumulative sum"
FROM customers as c
inner join orders AS o on c.customerid = o.customerid;