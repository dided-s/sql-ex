UPDATE outcomes
   SET result = (SELECT o2.result
                   FROM (SELECT *
                           FROM Outcomes) AS o2
                  WHERE o2.ship = Outcomes.ship
                    AND o2.battle <> Outcomes.battle)
 WHERE ship IN
       (SELECT ship
          FROM (SELECT *
                  FROM Outcomes) AS o
         GROUP BY ship
        HAVING COUNT(battle) = 2);


UPDATE Outcomes
   SET result = (SELECT o2.result
                   FROM (SELECT *
                           FROM Outcomes) AS o2 -- производная таблица, чтобы избежать конфликта
                  WHERE o2.ship = Outcomes.ship
                    AND o2.battle <> Outcomes.battle)
 WHERE ship IN
       (SELECT ship
          FROM Outcomes
         GROUP BY ship
        HAVING COUNT(battle) = 2);
