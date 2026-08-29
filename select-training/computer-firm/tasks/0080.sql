  WITH maker_with_model_in_not_null AS (
           SELECT maker
             FROM product
                  LEFT JOIN pc
                  ON pc.model = product.model
            WHERE product.type = 'PC'
            GROUP BY maker
           HAVING COUNT(*) != COUNT(pc.model))
SELECT DISTINCT maker
  FROM product
 WHERE maker NOT IN
       (SELECT maker
          FROM maker_with_model_in_not_null);

SELECT DISTINCT maker
  FROM product
 WHERE maker NOT IN
       (SELECT maker FROM product
         WHERE type = 'pc' AND model NOT IN (SELECT model FROM pc));

SELECT maker
  FROM product

EXCEPT

SELECT maker
  FROM product
 WHERE type = 'pc'
   AND model NOT IN (SELECT model FROM pc);
