/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question: 
* Assuming a students minimum age for the class is 15, what is the average age of a student?
*/
SELECT AVG(coalesce(age, '15')) 
FROM "Student"
-- result: 30.4

/*
* DB: https://www.db-fiddle.com/f/PnGNcaPYfGoEDvfexzEUA/0
* Question: 
* Replace all empty first or last names with a default?
*/
SELECT coalesce(name, 'not provided') AS "first_name",
	   coalesce(lastname, 'not provided') AS "last_name"
from "Student";