  WITH not_model_table AS (
           SELECT *
             FROM product
            WHERE model NOT IN
                  (SELECT model
                     FROM printer)
              AND model NOT IN
                  (SELECT model
                     FROM pc)
              AND model NOT IN
                  (SELECT model
                     FROM laptop))
DELETE
  FROM product
 WHERE model IN (SELECT not_model_table.model
                   FROM not_model_table);
