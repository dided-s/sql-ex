 MERGE INTO pc
 USING laptop
    ON pc.code = laptop.code
  WHEN MATCHED THEN
       UPDATE
          SET pc.ram = laptop.ram,
              pc.hd = laptop.hd
  WHEN NOT MATCHED BY TARGET THEN
       INSERT (code, model, speed, ram, hd, cd, price)
       VALUES (laptop.code, laptop.model, laptop.speed, laptop.ram, laptop.hd, 'Quantum', laptop.price)
  WHEN NOT MATCHED BY SOURCE THEN
       DELETE;