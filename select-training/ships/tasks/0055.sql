SELECT classes.class, MIN(launched)
  FROM classes
       LEFT JOIN ships
       ON ships.class = classes.class
 GROUP BY classes.class;
