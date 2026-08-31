  WITH all_ships AS (
           SELECT country, name
             FROM classes
             JOIN ships
               ON classes.class = ships.class

            UNION

           SELECT country, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship),
/* number of sunked ships */
       sunked_ships AS (
           SELECT country, COUNT(*) AS total
             FROM all_ships
                  LEFT JOIN outcomes
                  ON all_ships.name = outcomes.ship
            WHERE result = 'sunk'
            GROUP BY country),
/* total number of ships */
       ships_count_table AS (
           SELECT country, COUNT(*) AS total
             FROM all_ships
            GROUP BY country)
SELECT ships_count_table.country
  FROM ships_count_table
  JOIN sunked_ships
    ON ships_count_table.country = sunked_ships.country
 WHERE ships_count_table.total = sunked_ships.total;
