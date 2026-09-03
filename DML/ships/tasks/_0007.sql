INSERT INTO outcomes (ship, battle, result)
SELECT 'Rodney', name, 'sunk'
  FROM battles
 WHERE CONVERT(VARCHAR(10), date, 103) = '25/10/1944'

 UNION

SELECT 'Nelson', name, 'damaged'
  FROM battles
 WHERE CONVERT(VARCHAR(10), date, 103) = '28/01/1945';
