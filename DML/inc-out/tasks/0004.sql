INSERT INTO income_o (point, date, inc)
SELECT outcome_o.point, outcome_o.date, ROUND(outcome_o.out, -2)
  FROM outcome_o
       LEFT JOIN income_o
       ON income_o.point = outcome_o.point
          AND income_o.date = outcome_o.date
 WHERE income_o.inc IS NULL;
