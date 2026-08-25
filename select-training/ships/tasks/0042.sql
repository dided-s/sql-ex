SELECT ship, battle
  FROM outcomes
  JOIN battles
    ON battles.name = outcomes.battle
 WHERE result = 'sunk';
