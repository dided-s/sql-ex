SELECT name
  FROM ships
  JOIN classes
    ON ships.class = classes.class
 WHERE type = 'bb'
   AND launched >= 1922
   AND displacement > 35000;
