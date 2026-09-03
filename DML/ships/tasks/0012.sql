/* Неверное */

  WITH country_avg_launched AS (
           SELECT country,
                  ROUND(AVG(CAST(ships.launched AS FLOAT)), 0) AS avg_launched
             FROM classes
             JOIN ships
               ON ships.class = classes.class
            GROUP BY country)
INSERT INTO ships (name, class, launched)
SELECT DISTINCT outcomes.ship, classes.class, avg_launched
  FROM outcomes
  JOIN classes
    ON outcomes.ship = classes.class
  JOIN country_avg_launched
    ON classes.country = country_avg_launched.country
 WHERE outcomes.ship NOT IN
       (SELECT name
          FROM ships);

/* Верное */

  WITH country_avg_launched AS (
           SELECT c.country,
                  ROUND(AVG(CAST(s.launched AS FLOAT)), 0) AS avg_launched
             FROM classes AS c
             JOIN ships AS s
               ON s.class = c.class
            GROUP BY c.country),
       outcomes_ships AS (
           SELECT DISTINCT o.ship, c.class, c.country
             FROM outcomes AS o
             JOIN classes AS c
               ON o.ship = c.class
            WHERE o.ship NOT IN
                  (SELECT name
                     FROM ships))
INSERT INTO ships (name, class, launched)
SELECT outcomes_ships.ship,
       outcomes_ships.class,
       country_avg_launched.avg_launched
  FROM outcomes_ships
  JOIN country_avg_launched AS country_avg_launched
    ON country_avg_launched.country = outcomes_ships.country
 WHERE country_avg_launched.avg_launched IS NOT NULL;
