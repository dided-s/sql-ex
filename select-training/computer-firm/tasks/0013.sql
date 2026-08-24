SELECT AVG(speed)
  FROM pc
  JOIN Product
    ON pc.model = Product.model
 WHERE maker = 'A';
