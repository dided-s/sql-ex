SELECT CAST(AVG(numGuns * 1.0) AS DECIMAL(10, 2)) AS avg_numguns
  FROM classes
 WHERE type = 'bb';
