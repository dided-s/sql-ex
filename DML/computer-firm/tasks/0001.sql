INSERT INTO product (maker, model, type)
VALUES ('A', 2111, 'PC');

INSERT INTO pc (code, model, speed, ram, hd, cd, price)
VALUES (20, 2111, 950, 512, 60, '52x', 1100);

SELECT *
  FROM pc
 WHERE model = 2111;
