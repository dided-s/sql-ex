  WITH next_battle_table AS (
/* getting battles and NEXT battles */
/* in one table */
           SELECT name, LEAD(name) OVER (ORDER BY date ASC) AS nextbattle, date
             FROM battles),
       outcomes_battles AS (
           SELECT ship,
                  battle,
                  nextbattle,
                  COUNT(*) OVER (PARTITION BY ship) AS num_battles,
                  date,
                  result
             FROM outcomes
             JOIN next_battle_table
               ON outcomes.battle = next_battle_table.name)
INSERT INTO outcomes (ship, battle, result)
SELECT ship,
       nextbattle AS battle,
       'sunk' AS result
  FROM outcomes_battles
 WHERE num_battles = 1
   AND result = 'damaged'
   AND nextbattle IS NOT NULL;
