SELECT AVG(price)
  FROM (SELECT price
          FROM pc
          JOIN Product
            ON Product.model = pc.model
         WHERE maker = 'A'

         UNION ALL

        SELECT price
          FROM Laptop
          JOIN Product
            ON Product.model = Laptop.model
         WHERE maker = 'A') AS PC_Laptop_table;
