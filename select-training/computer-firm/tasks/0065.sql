  WITH dense_number_table AS (
           SELECT DISTINCT maker,
                  type,
                  DENSE_RANK() OVER (PARTITION BY maker
                                         ORDER BY CASE
                                         WHEN type = 'PC' THEN 1
                                         WHEN type = 'Laptop' THEN 2
                                         WHEN type = 'Printer' THEN 3
                                         END) AS dense_num
             FROM product)
SELECT ROW_NUMBER() OVER (ORDER BY maker, dense_num) AS num,
       CASE
       WHEN dense_num = 1 THEN maker
       ELSE ''
       END AS maker,
       type
  FROM dense_number_table;
