INSERT INTO pc (code, model, speed, ram, hd, price)
SELECT MIN(code) + 20,
       model + 1000,
       MAX(speed),
       MAX(ram) * 2,
       MAX(hd) * 2,
       MAX(price) / 1.5
  FROM Laptop
 GROUP BY model;

SELECT *
  FROM product
 WHERE model = '4444';
