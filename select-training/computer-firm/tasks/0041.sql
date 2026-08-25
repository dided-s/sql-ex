  WITH all_models AS (
           SELECT maker, product.model, price
             FROM product
             JOIN printer
               ON product.model = printer.model

            UNION

           SELECT maker, product.model, price
             FROM product
             JOIN laptop
               ON product.model = laptop.model

            UNION

           SELECT maker, product.model, price
             FROM product
             JOIN pc
               ON product.model = pc.model)
SELECT maker,
       CASE
       WHEN maker IN (SELECT maker FROM all_models WHERE price IS NULL) THEN NULL
       ELSE MAX(price)
       END
  FROM all_models
 GROUP BY maker;
