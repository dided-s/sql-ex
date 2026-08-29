SELECT maker,
       MAX(laptop.price) AS laptop,
       MAX(pc.price) AS pc,
       MAX(printer.price) AS printer
  FROM product
       LEFT JOIN laptop
       ON product.type = 'laptop'
          AND product.model = laptop.model

       LEFT JOIN pc
       ON product.type = 'pc'
          AND product.model = pc.model

       LEFT JOIN printer
       ON product.type = 'printer'
          AND product.model = printer.model
 GROUP BY maker
HAVING MAX(laptop.price) IS NOT NULL
    OR MAX(pc.price) IS NOT NULL
    OR MAX(printer.price) IS NOT NULL
 ORDER BY maker;
