SELECT income.point, income.date, 'inc', SUM(income.inc)
  FROM income
       LEFT JOIN outcome
       ON income.point = outcome.point
          AND income.date = outcome.date
 WHERE outcome.code IS NULL
 GROUP BY income.point, income.date

 UNION

SELECT outcome.point, outcome.date, 'out', SUM(outcome.out)
  FROM outcome
       LEFT JOIN income
       ON outcome.point = income.point
          AND outcome.date = income.date
 WHERE income.code IS NULL
 GROUP BY outcome.point, outcome.date;
