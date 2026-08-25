  WITH maker_models_count AS (
           SELECT maker, COUNT(*) AS count
             FROM product
            GROUP BY maker),
       all_makers_types AS (
           SELECT DISTINCT product.maker, p2.type
             FROM product,
                  product AS p2)
SELECT all_makers_types.maker,
       all_makers_types.type,
       CAST(100.00 * COUNT(model) / (SELECT count FROM maker_models_count
                                     WHERE maker_models_count.maker = all_makers_types.maker) AS DECIMAL(6, 2))
  FROM all_makers_types
       LEFT JOIN product
       ON all_makers_types.maker = product.maker
          AND all_makers_types.type = product.type
 GROUP BY all_makers_types.maker, all_makers_types.type
 ORDER BY all_makers_types.maker, all_makers_types.type;

  WITH all_makers_types_count AS (
           SELECT maker,
                  type,
                  (SELECT COUNT(model)
                     FROM product
                    GROUP BY product.maker
                   HAVING makers.maker = product.maker) AS maker_all_count,
                  ifnull((SELECT COUNT(model)
  FROM product
 GROUP BY product.maker, product.type
HAVING makers.maker = product.maker
   AND types.type = product.type), 0) AS maker_type_count
             FROM (SELECT DISTINCT maker
                     FROM product) AS makers,
                  (SELECT DISTINCT type
                     FROM product) AS types
            ORDER BY maker)
SELECT maker,
       type,
       CAST(100.00 * maker_type_count / maker_all_count AS DECIMAL(6, 2))
  FROM all_makers_types_count;

SELECT COUNT(model)
  FROM product
 GROUP BY product.maker, product.type;
