  WITH all_ships AS (
           SELECT classes.class, name
             FROM ships
             JOIN classes
               ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT all_ships.name
  FROM all_ships
       LEFT JOIN classes
       ON all_ships.class = classes.class
 WHERE bore = 16;
