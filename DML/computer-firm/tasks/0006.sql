DELETE
  FROM Laptop
 WHERE model NOT IN
       (SELECT model
          FROM Product
         WHERE maker IN
               (SELECT maker
                  FROM Product
                 WHERE type = 'Printer'));
