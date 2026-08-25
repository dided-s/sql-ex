SELECT classes.class
  FROM classes
  JOIN ships
    ON classes.class = ships.name

 UNION

SELECT classes.class
  FROM classes
  JOIN outcomes
    ON classes.class = outcomes.ship;
