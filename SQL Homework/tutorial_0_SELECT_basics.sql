/*TUTORIAL 0 SELECT basics */

/*1. Show the population of Germany */
SELECT population FROM world
    WHERE name = 'Germany';


/*2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark' */
SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway', 'Denmark');


/*3. Countries with an area of 200,000-250,000 sq. km */
SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000;