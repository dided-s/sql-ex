  WITH all_ships AS (
           SELECT classes.class, name, classes.type, classes.numGuns
             FROM ships
             JOIN classes
               ON classes.class = ships.class

            UNION

           SELECT class, ship, classes.type, classes.numGuns
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT CAST(AVG(numGuns * 1.0) AS DECIMAL(10, 2)) AS avg_numguns
  FROM all_ships
 WHERE type = 'bb';
