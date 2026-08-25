  WITH all_ships AS (
           SELECT name
             FROM ships

            UNION

           SELECT ship
             FROM outcomes)
SELECT name
  FROM all_ships
 WHERE name LIKE 'R%';
