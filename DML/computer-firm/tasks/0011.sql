INSERT INTO pc (code, model, speed, ram, hd, cd, price)
SELECT MIN(code) + 20,
       model + 1000,
       MAX(speed),
       MAX(ram) * 2,
       MAX(hd) * 2,
       (SELECT CONCAT(MAX(CAST(REPLACE(cd, 'x', '') AS INT)), 'x')
          FROM pc) AS cd,
       MAX(price) / 1.5
  FROM laptop
 GROUP BY model;
