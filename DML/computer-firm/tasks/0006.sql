DELETE
  FROM Laptop
 WHERE model NOT IN
       (SELECT model
          FROM Product
         WHERE maker IN
               (SELECT maker
                  FROM Product
                 WHERE type = 'Printer'));

  WITH not_printer_models AS (
           SELECT model
             FROM Product
            WHERE maker IN
                  (SELECT maker
                     FROM Product
                    WHERE type = 'Printer'))
DELETE
  FROM Laptop
 WHERE model NOT IN
       (SELECT model
          FROM not_printer_models);
