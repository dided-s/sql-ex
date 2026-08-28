  WITH union_table AS (
           SELECT point, date, income.inc AS money
             FROM income

            UNION ALL

           SELECT point, date, -1 * outcome.out
             FROM outcome)
SELECT DISTINCT point,
       #CONVERT(varchar, CONVERT(DATETIME, union_table.date, 103), 103),
       date_format(union_table.date, '%d/%m,%Y'),
       (SELECT SUM(u2.money)
          FROM union_table AS u2
         WHERE u2.date <= union_table.date
           AND u2.point = union_table.point) AS cumulative
  FROM union_table
 ORDER BY point, union_;
