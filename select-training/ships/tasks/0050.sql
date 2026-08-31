SELECT DISTINCT battle
  FROM ships
  JOIN outcomes
    ON ships.name = outcomes.ship
 WHERE ships.class = 'Kongo';
