SELECT ships.name
  FROM ships
  JOIN classes
    ON classes.class = ships.class
 WHERE country = 'Japan'
   AND type = 'bb'
   AND (numguns >= 9
        OR numguns IS NULL)
   AND (bore < 19
        OR bore IS NULL)
   AND (displacement <= 65000
        OR displacement IS NULL);
