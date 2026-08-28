  WITH month_table AS (
           SELECT YEAR(date) AS year,
                  MONTH(date) AS month,
                  SUM(outcome.out) AS sum
             FROM outcome
            GROUP BY YEAR(date), MONTH(date)),
       max_sum_month_table AS (
           SELECT year, month, sum
             FROM month_table
            WHERE sum = (SELECT MAX(sum)
                           FROM month_table))
SELECT outcome.code, outcome.point, outcome.date, outcome.out
  FROM outcome
  JOIN max_sum_month_table
    ON YEAR(outcome.date) = max_sum_month_table.year
       AND MONTH(outcome.date) = max_sum_month_table.month;
