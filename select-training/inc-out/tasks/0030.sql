SELECT point, date, SUM(sum_out), SUM(sum_inc)
  FROM (SELECT point,
               date, SUM(inc) AS sum_inc, NULL AS sum_out
          FROM Income
         GROUP BY point, date

         UNION

        SELECT point,
               date, NULL AS sum_inc, SUM(`out`) AS sum_out
          FROM Outcome
         GROUP BY point, date) AS t
 GROUP BY point, date
 ORDER BY point;
