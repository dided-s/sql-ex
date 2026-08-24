SELECT DISTINCT 'Laptop' AS type, model, speed
  FROM Laptop
 WHERE speed < (SELECT MIN(speed)
                  FROM pc);
