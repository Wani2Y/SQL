-- clue 1 - 3
-- all entries are on 2020-06-23 so the date filter is meaningless

SELECT *
FROM "public"."vehicle_location_histories"
WHERE city = 'new york' AND
	  DATE_TRUNC ('day', "timestamp") = '2020-06-23'::date AND
      (lat between -74.997 and -74.9968) AND
      (long between 40.5 and 40.6);

-- create a view to store the information
CREATE VIEW suspected_rides AS 
SELECT *
FROM "public"."vehicle_location_histories"
WHERE city = 'new york' AND
	  DATE_TRUNC ('day', "timestamp") = '2020-06-23'::date AND
      (lat between -74.997 and -74.9968) AND
      (long between 40.5 and 40.6);

-- we can also find the unique entries of rides matching the suspected timeframe
SELECT DISTINCT on (r.vehicle_id) r.vehicle_id, sr.timestamp, u.name, v.type
from suspected_rides as sr
INNER JOIN rides as r on sr.ride_id = r.id
INNER JOIN vehicles AS v on r.vehicle_id = v.id
INNER JOIN users as u on v.owner_id = u.id;

-- clue 4
SELECT DISTINCT on (u.name) u.name AS "rider_name", u.id, u.address, sr.timestamp 
from suspected_rides as sr
INNER JOIN rides as r on sr.ride_id = r.id
INNER JOIN users as u on r.rider_id = u.id
ORDER BY "rider_name"

-- clue 5 and 6
-- create a view for suspected riders with only their names
CREATE VIEW suspected_rider AS
    SELECT DISTINCT split_part(u.name, ' ', 1) AS "first_name", split_part(u.name, ' ', 2) AS "last_name"
    from suspected_rides as sr
    INNER JOIN rides as r on sr.ride_id = r.id
    INNER JOIN users as u on r.rider_id = u.id
    ORDER BY first_name;

-- match the names of supsected riders with the employees at Movr assuming the culprit is a family member
SELECT DISTINCT concat(emp_tab.first_name, ' ', emp_tab.last_name) AS employee_names,
       concat(sr.first_name, ' ', sr.last_name) AS suspected_rider_names
FROM dblink('host=localhost user=postgres password=Wani2Y@SQL dbname=Movr_Employees', 'SELECT first_name, last_name FROM employees;') 
    AS emp_tab(first_name NAME, last_name NAME)
INNER JOIN suspected_rider AS sr on emp_tab.last_name = sr.last_name;