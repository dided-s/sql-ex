DELETE
  FROM pc
 WHERE hd =
       (SELECT min_hd
          FROM (SELECT MIN(hd) AS min_hd
                  FROM pc) AS t)
    OR ram =
       (SELECT min_ram
          FROM (SELECT MIN(ram) AS min_ram
                  FROM pc) AS t2);

DELETE
  FROM pc
 WHERE hd = (SELECT MIN(hd)
               FROM pc)
    OR ram = (SELECT MIN(ram)
                FROM pc);

  WITH min_hd_table AS (
           SELECT MIN(hd) FROM pc),
       min_ram_table AS (
           SELECT MIN(ram) FROM pc)
DELETE
  FROM pc
 WHERE hd = (SELECT min_hd FROM min_hd_table)
    OR ram = (SELECT min_ram FROM min_ram_table);
