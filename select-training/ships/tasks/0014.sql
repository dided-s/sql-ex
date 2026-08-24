SELECT ships.class, name, country
  FROM classes
  JOIN ships
    ON classes.class = ships.class
 WHERE numGuns >= 10;
