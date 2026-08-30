DELETE
  FROM Ships
 WHERE name IN
       (SELECT ship
          FROM Outcomes
         WHERE result = 'sunk');
