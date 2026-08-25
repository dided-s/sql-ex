  WITH maker_with_one_type AS (
           SELECT maker
             FROM product
            GROUP BY maker
           HAVING COUNT(DISTINCT type) = 1
              AND COUNT(model) > 1)
SELECT DISTINCT maker, type
  FROM product
 WHERE maker IN (SELECT *
                   FROM maker_with_one_type);