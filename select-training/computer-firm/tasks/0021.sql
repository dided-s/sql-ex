SELECT maker, MAX(price)
  FROM pc
  JOIN Product
    ON Product.model = pc.model
 GROUP BY maker;
