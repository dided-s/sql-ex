  WITH all_ships AS (
           SELECT country, bore, name
             FROM classes
             JOIN ships
               ON classes.class = ships.class

            UNION

           SELECT country, bore, ship
             FROM classes
             JOIN outcomes
               ON classes.class = outcomes.ship)
SELECT country,
       CAST(AVG((bore * bore * bore) / 2) AS DECIMAL(10, 2)) AS mw
  FROM all_ships
 GROUP BY country;

SELECT *
  FROM classes;

SELECT *
  FROM outcomes;
