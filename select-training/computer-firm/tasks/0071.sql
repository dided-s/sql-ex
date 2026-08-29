SELECT product.maker
  FROM product
       LEFT JOIN pc
       ON product.model = pc.model
 WHERE product.type = 'pc'
 GROUP BY maker
HAVING COUNT(product.model) = COUNT(pc.model);

  WITH maker_null AS (
           SELECT product.maker
             FROM product
                  LEFT JOIN pc
                  ON pc.model = product.model
            WHERE type = 'PC'
              AND pc.code IS NULL)
SELECT DISTINCT maker
  FROM product
 WHERE type = 'PC'
   AND maker NOT IN
       (SELECT maker
          FROM maker_null);
