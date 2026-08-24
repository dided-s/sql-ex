SELECT DISTINCT Product.model, price
  FROM pc
  JOIN Product
    ON Product.model = pc.model
 WHERE maker = 'B'

 UNION

SELECT DISTINCT Product.model, price
  FROM Laptop
  JOIN Product
    ON Product.model = Laptop.model
 WHERE maker = 'B'

 UNION

SELECT DISTINCT Product.model, price
  FROM Printer
  JOIN Product
    ON Product.model = Printer.model
 WHERE maker = 'B';
