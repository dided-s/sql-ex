SELECT DISTINCT pc1.model, pc2.model, pc1.speed, pc1.ram
  FROM pc AS pc1
  JOIN pc AS pc2
    ON pc1.speed = pc2.speed
       AND pc1.ram = pc2.ram
 WHERE pc1.model > pc2.model;
