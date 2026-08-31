  WITH all_classes AS (
           SELECT classes.class, name AS ship_name
             FROM classes
                  LEFT JOIN ships
                  ON classes.class = ships.class

            UNION

           SELECT class, ship AS ship_name
             FROM classes
             JOIN outcomes
               ON classes.class = outcomes.ship),
       all_ships AS (
           SELECT classes.class, name
             FROM ships
                  LEFT JOIN classes
                  ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT all_classes.class,
       SUM(CASE WHEN result = 'sunk' THEN 1 ELSE 0 END) AS sunk_count
  FROM all_classes
       LEFT JOIN outcomes
       ON all_classes.ship_name = outcomes.ship
 GROUP BY all_classes.class
HAVING SUM(CASE WHEN result = 'sunk' THEN 1 ELSE 0 END) > 0
   AND (SELECT COUNT(all_ships.name)
          FROM all_ships
         WHERE all_classes.class = all_ships.class
         GROUP BY all_ships.class) >= 3;
