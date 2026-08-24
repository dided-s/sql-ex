SELECT maker
  FROM Product
  JOIN pc
    ON Product.model = pc.model
 WHERE speed >= 750

INTERSECT

SELECT maker
  FROM Product
  JOIN Laptop
    ON Product.model = Laptop.model
 WHERE speed >= 750;
