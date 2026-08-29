SELECT *
  FROM laptop;

  WITH laptop_filter_table AS (
           SELECT laptop.model
             FROM product
             JOIN laptop
               ON product.model = laptop.model
            WHERE maker IN ('E', 'B'))
UPDATE laptop
   SET screen = screen + 1,
       price = price - 100
 WHERE model IN (SELECT model
                   FROM laptop_filter_table);
