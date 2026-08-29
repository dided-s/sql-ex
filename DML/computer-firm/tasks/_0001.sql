  WITH max_code_table AS (
           SELECT MAX(code) AS max_code
             FROM pc
            GROUP BY model)
DELETE
  FROM pc
 WHERE code NOT IN
       (SELECT max_code
          FROM max_code_table);
