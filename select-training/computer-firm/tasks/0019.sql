SELECT maker, AVG(screen)
  FROM Product
  JOIN Laptop
    ON Product.model = Laptop.model
 GROUP BY maker;
