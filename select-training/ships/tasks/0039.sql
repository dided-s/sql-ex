  WITH outcomes_with_battles AS (
           SELECT *
             FROM outcomes
             JOIN battles
               ON battles.name = outcomes.battle)
SELECT DISTINCT ship
  FROM outcomes_with_battles AS o1
 WHERE EXISTS
       (SELECT *
          FROM outcomes_with_battles AS o2
         WHERE o1.date > o2.date
           AND o2.result = 'damaged'
           AND o1.ship = o2.ship);
