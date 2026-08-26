SELECT SUM(union_table.income - union_table.outcome)
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
               outcome_o.date, COALESCE(income_o.inc, 0), outcome_o.out
          FROM income_o
               RIGHT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date) AS union_table
 WHERE date < '2001-04-15';
