SELECT maker, COUNT(*)
  FROM Product
 WHERE type = 'PC'
 GROUP BY maker
HAVING COUNT(*) >= 3;
