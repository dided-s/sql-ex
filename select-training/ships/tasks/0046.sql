SELECT DISTINCT outcomes.ship,
       classes.displacement,
       classes.numGuns
  FROM outcomes
       LEFT JOIN ships
       ON outcomes.ship = ships.name

       LEFT JOIN classes
       ON classes.class = ships.class
          OR classes.class = outcomes.ship
 WHERE battle LIKE 'Guadalcanal';
