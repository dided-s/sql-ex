SELECT income_o.point, income_o.date, income_o.inc, outcome_o.out
  FROM income_o
       LEFT JOIN outcome_o
       ON income_o.point = outcome_o.point
          AND income_o.date = outcome_o.date

 UNION

SELECT outcome_o.point,
       outcome_o.date, income_o.inc, outcome_o.out
  FROM income_o
       RIGHT JOIN outcome_o
       ON income_o.point = outcome_o.point
          AND income_o.date = outcome_o.date;
