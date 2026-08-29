INSERT INTO pc (code, model, speed, ram, hd, cd, price)
SELECT model + (SELECT MAX(code) FROM pc) AS code,
       model,
       (SELECT MAX(speed) FROM pc) AS speed,
       (SELECT MAX(ram) FROM pc) AS ram,
       (SELECT MAX(hd) FROM pc) AS hd,
       CONCAT(
           CAST(
               (SELECT MAX(CAST(SUBSTRING(cd, 1, LENGTH(cd) - 1) AS UNSIGNED))
                FROM pc) AS CHAR
           ), 'x'
       ) AS cd,
       (SELECT AVG(price) FROM pc) AS price
  FROM Product
 WHERE type = 'PC'
   AND model NOT IN
       (SELECT model FROM pc);
