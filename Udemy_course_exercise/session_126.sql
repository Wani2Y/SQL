/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/
SELECT DISTINCT(country.continent),
       sum(country.population) over(
       partition by country.continent) AS "con_population"
FROM country
order by country.continent;

/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/
SELECT DISTINCT(country.continent),
       sum(country.population) over(
       partition by country.continent) AS "con_population",
       concat(
       round((
       sum(country.population::float4) over(partition by country.continent)/
       sum(country.population::float4) over()
       )*100), '%') AS "world population percentage"
FROM country
group by (country.continent, country.population)
order by country.continent;

/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/
SELECT 
DISTINCT r.id, 
r."name", 
COUNT(t.id) OVER (
    PARTITION BY r.id
    ORDER BY r."name"
) AS "number of towns"
FROM regions AS r
JOIN departments AS d ON r.code = d.region 
JOIN towns AS t ON d.code = t.department
ORDER BY r.id;
