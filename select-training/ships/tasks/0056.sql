  WITH all_ships AS (
           SELECT classes.class, name
             FROM classes
                  LEFT JOIN ships
                  ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM classes
                  LEFT JOIN outcomes
                  ON classes.class = outcomes.ship)
SELECT all_ships.class,
       SUM(CASE WHEN result = 'sunk' THEN 1 ELSE 0 END) AS sunk_count
  FROM all_ships
       LEFT JOIN outcomes
       ON all_ships.name = outcomes.ship
 GROUP BY all_ships.class;
