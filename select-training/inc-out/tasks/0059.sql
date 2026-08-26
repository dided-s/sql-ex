SELECT point, SUM(union_table.income - union_table.outcome)
  FROM (SELECT income_o.point,
               income_o.date,
               income_o.inc AS income,
               CASE
               WHEN outcome_o.out IS NULL THEN 0
               ELSE outcome_o.out
               END AS outcome
          FROM income_o
               LEFT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date

         UNION

        SELECT outcome_o.point,
               outcome_o.date,
               CASE
               WHEN income_o.inc IS NULL THEN 0
               ELSE income_o.inc
               END,
               outcome_o.out
          FROM income_o
               RIGHT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date) AS union_table
 GROUP BY union_table.point;


 SELECT point, SUM(union_table.income - union_table.outcome)
  FROM (SELECT income_o.point,
               income_o.date,
               income_o.inc AS income,
               COALESCE(outcome_o.out, 0) AS outcome
          FROM income_o
               LEFT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date

         UNION

        SELECT outcome_o.point,
               outcome_o.date,
               COALESCE(income_o.inc, 0),
               outcome_o.out
          FROM income_o
               RIGHT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date) AS union_table
 GROUP BY union_table.point;