/*TUTORIAL 4 SELECT within SELECT */

/*1. Countries with population larger than that of Russia */
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

/*2.  Show the countries in Europe with a per capita GDP greater than 'United Kingdom*/
SELECT name FROM world
  WHERE gdp/population > 
    (SElECT gdp/population FROM world WHERE name = 'United Kingdom');

/*3. List the name and continent of countries in the continents containing either Argentina or Australia. */
SELECT name, continent FROM world
  WHERE continent IN 
    (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
  ORDER BY name;

/*4. Which country has a population that is more than Canada but less than Poland?  */
SELECT name, population FROM world
  WHERE population > 
    (SELECT population FROM world WHERE name = 'Canada') 
  AND population < 
    (SELECT population FROM world WHERE name = 'Poland');

/*5. Show the name and the population of each country in Europe, as a percentage of the population of Germany. */
SELECT name, 
    concat(ROUND(100*population/(SELECT population FROM world WHERE name='Germany'),0),'%') AS percentage 
FROM world
  WHERE continent = 'Europe';

/*6. Which countries have a GDP greater than every country in Europe?  */
SELECT name FROM world
  WHERE gdp > 
    ALL(SELECT gdp FROM world WHERE continent = 'Europe' And gdp > 0);

/*7. Find the largest country (by area) in each continent, show the continent, the name and the area */
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area > 0)

/*8. List each continent and the name of the country that comes first alphabetically */
SELECT continent, name FROM world x
  WHERE name<= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent)

/*9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents.  */
SELECT name, continent, population FROM world x
   WHERE 25000000 >= ALL
       (SELECT population FROM world y
           WHERE y.continent=x.continent)

/*10. Show countries that have populations more than 3 times that of any of their neighbors.*/
SELECT name, continent FROM world x
   WHERE population/3 >= ALL
       (SELECT population FROM world y
           WHERE y.continent=x.continent AND x.name<>y.name)

