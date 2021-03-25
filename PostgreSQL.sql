/*
Q: 1. How many entries in the countries table are from Africa?
*/

SELECT COUNT(continent)
FROM countries
WHERE continent = 'Africa';

/*
A => 56 entries
*/

/*
Q: 2. What was the total population of the continent of Oceania in 2005?
*/

SELECT COUNT(*)
FROM countries, population_years
WHERE continent = 'Oceania' AND year = 2005;

/*
A: => 3621
*/

/*
Q: 3. What is the average population of countries in South America in 2003?
*/

SELECT ROUND(AVG(population), 2)
FROM countries, population_years
WHERE continent = 'South America' AND year = 2003;

/*
A: => 29.66
*/

/*
Q: 4. What country had the smallest population in 2007?
*/

SELECT name
FROM population_years 
JOIN countries
ON population_years.country_id = countries.id
WHERE population = (SELECT MIN(population) 
			 		FROM population_years
				   	WHERE year = 2007)				   
AND year = 2007;

/*
A => Niue
*/

/*
Q: 5. What is the average population of Ukraine during the time period covered by this dataset?
*/

SELECT ROUND(AVG(population))
FROM population_years
WHERE country_id = (SELECT id
					 FROM countries
					 WHERE name = 'Ukraine');

/*
A: => 47
*/

/*
Q: 6. How many countries have the word “The” in their name?
*/

SELECT COUNT(name)
FROM countries
WHERE name LIKE '%The%';

/*
A: => 2
*/

/*
Q: 7. What was the total population of each continent in 2010?
*/

SELECT ROUND(SUM(population)), countries.continent, year
FROM population_years 
LEFT JOIN countries
ON countries.id = population_years.country_id
GROUP BY countries.continent, year
having year = 2010;

/*
A:

540	    	"North America"	    	2010
35	    	"Oceania"	        2010
4133		"Asia"	            	2010
1015		"Africa"	        2010
723	    	"Europe"	        2010
397	    	"South America"	    	2010

*/
