  WITH all_ships AS (
           SELECT classes.class, name
             FROM classes
             JOIN ships
               ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT DISTINCT class
  FROM all_ships
  JOIN outcomes
    ON all_ships.name = outcomes.ship
 WHERE result = 'sunk';
