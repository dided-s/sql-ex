     WITH PC_ram_table AS (
              SELECT maker
                FROM Product
                JOIN pc
                  ON pc.model = Product.model
               WHERE speed =
                     (SELECT MAX(speed)
                        FROM pc
                       WHERE ram = (SELECT MIN(ram)
                                      FROM pc))
                 AND ram = (SELECT MIN(ram)
                              FROM pc))
SELECT maker
  FROM Product
 WHERE type = 'Printer'

INTERSECT

SELECT *
  FROM PC_ram_table;
