  WITH all_ships AS (
           SELECT class, name
             FROM ships

            UNION

           SELECT ship, ship
             FROM outcomes
            WHERE outcomes.ship IN (SELECT class
                                      FROM Classes))
SELECT class
  FROM all_ships
 GROUP BY class
HAVING COUNT(class) = 1;
