  WITH all_ships AS (
           SELECT classes.class, name
             FROM ships
             JOIN classes
               ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship),
       max_numGuns_table AS (
           SELECT classes.displacement,
                  MAX(classes.numGuns) AS max_numGuns
             FROM all_ships
             JOIN classes
               ON all_ships.class = classes.class
            GROUP BY classes.displacement)
SELECT DISTINCT all_ships.name
  FROM all_ships
  JOIN classes
    ON all_ships.class = classes.class
 WHERE (classes.displacement, classes.numGuns) IN (SELECT *
                                                     FROM max_numGuns_table);

  WITH all_ships AS (
           SELECT classes.class, name, classes.displacement, classes.numGuns
             FROM ships
             JOIN classes
               ON classes.class = ships.class

            UNION

           SELECT class, ship, classes.displacement, classes.numGuns
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship),
       max_numGuns_table AS (
           SELECT classes.displacement AS displacement,
                  MAX(classes.numGuns) AS max_numGuns
             FROM all_ships
             JOIN classes
               ON all_ships.class = classes.class
            GROUP BY classes.displacement)
SELECT DISTINCT all_ships.name
  FROM all_ships
  JOIN max_numGuns_table
    ON all_ships.displacement = max_numGuns_table.displacement
       AND all_ships.numGuns = max_numGuns_table.max_numGuns;
