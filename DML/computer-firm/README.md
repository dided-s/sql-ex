# 1. Компьютерная фирма
Схема БД состоит из четырех таблиц:

- Product(maker, model, type)
- PC(code, model, speed, ram, hd, cd, price)
- Laptop(code, model, speed, ram, hd, price, screen)
- Printer(code, model, color, type, price)

Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов.

 В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах).

Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). 

В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.

![image.png](image.png)

### Внимание! Таблицы для DML отличаются от основных

[create_database_dml.sql](./../../databases/create_database.sql) - скрипт для создания ДБ

[computer_dml_script.sql](./../../databases/computer_dml_script.sql) - скрипт для создания "Компьютерная фирма" DML


```python
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="02915678",
    database="dml_computer"
)

cur = conn.cursor()

with open("../../databases/computer_dml_script.sql", "r", encoding="utf-8") as f:
    sql_script = f.read()

for stmt in sql_script.split(";"):
    stmt = stmt.strip()
    if stmt:
        cur.execute(stmt)

conn.commit()
cur.close()
conn.close()
```

### Задание: -1 (Serge I: 2009-06-05) [1]
Из каждой группы ПК с одинаковым номером модели в таблице PC удалить все строки кроме строки с наибольшим для этой группы кодом (столбец code).


```sql
%%sql
  WITH max_code_table AS (
           SELECT MAX(code) AS max_code
             FROM pc
            GROUP BY model)
DELETE
  FROM pc
 WHERE code NOT IN
       (SELECT max_code
          FROM max_code_table);

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
    4 rows affected.





    []



### Задание: -2 (Serge I: 2004-09-09) [2]
Добавьте один дюйм к размеру экрана каждого блокнота,
выпущенного производителями E и B, и уменьшите его цену на $100.


```sql
%%sql
  WITH laptop_filter_table AS (
           SELECT laptop.model
             FROM product
             JOIN laptop
               ON product.model = laptop.model
            WHERE maker IN ('E', 'B'))
UPDATE laptop
   SET screen = screen + 1,
       price = price - 100
 WHERE model IN (SELECT model
                   FROM laptop_filter_table);
```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
    1 rows affected.





    []



### Задание: -4 (Serge I: 2004-09-09) [1]
Удалить из таблицы Product те модели, которые отсутствуют в других таблицах.


```sql
%%sql
  WITH not_model_table AS (
           SELECT *
             FROM product
            WHERE model NOT IN
                  (SELECT model
                     FROM printer)
              AND model NOT IN
                  (SELECT model
                     FROM pc)
              AND model NOT IN
                  (SELECT model
                     FROM laptop))
DELETE
  FROM product
 WHERE model IN (SELECT not_model_table.model
                   FROM not_model_table);

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
    4 rows affected.





    []



### Задание: -5 (Serge I: 2004-09-08) [1]
Для каждой группы блокнотов с одинаковым номером модели добавить запись в таблицу PC со следующими характеристиками:

код: минимальный код блокнота в группе +20;<br>
модель: номер модели блокнота +1000;<br>
скорость: максимальная скорость блокнота в группе;<br>
ram: максимальный объем ram блокнота в группе *2;<br>
hd: максимальный объем hd блокнота в группе *2;<br>
cd: значение по умолчанию;<br>
цена: максимальная цена блокнота в группе, уменьшенная в 1,5 раза.

Замечание. Считать номер модели числом.


```sql
%%sql
INSERT INTO pc (code, model, speed, ram, hd, price)
SELECT MIN(code) + 20,
       model + 1000,
       MAX(speed),
       MAX(ram) * 2,
       MAX(hd) * 2,
       MAX(price) / 1.5
  FROM Laptop
 GROUP BY model;

```

### Задание: -6 (Serge I: 2004-09-08) [1]
Производство принтеров производитель A передал производителю Z. Выполнить соответствующее изменение.


```sql
%%sql
UPDATE Product
   SET maker = 'Z'
 WHERE maker = 'A'
   AND type = 'Printer';

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
    3 rows affected.





    []



### Задание: 1 (Serge I: 2004-09-08) [1]
Добавить в таблицу PC следующую модель:
code: 20<br>
model: 2111<br>
speed: 950<br>
ram: 512<br>
hd: 60<br>
cd: 52x<br>
price: 1100<br>


```sql
%%sql
INSERT INTO PC (code, model, speed, ram, hd, cd, price)
VALUES (20, 2111, 950, 512, 60, '52x', 1100)
```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
    1 rows affected.





    []



### Задание: 2 (Serge I: 2004-09-08) [1]
Добавить в таблицу Product следующие продукты производителя Z:
принтер модели 4003, ПК модели 4001 и блокнот модели 4002


```sql
%%sql
INSERT INTO Product (maker, model, type)
VALUES
	('Z', 4003, 'Printer'),
	('Z', 4001, 'PC'),
	('Z', 4002, 'Laptop')

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
       mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





    []



### Задание: 3 (Serge I: 2004-09-08) [1]
Добавить в таблицу PC модель 4444 с кодом 22, имеющую скорость процессора 1200 и цену 1350.

Отсутствующие характеристики должны быть восполнены значениями по умолчанию, принятыми для соответствующих столбцов.


```sql
%%sql
INSERT INTO pc (model, code, speed, price)
VALUES (4444, 22, 1200, 1350);

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
       mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





    []



### Задание: 5 (Serge I: 2004-09-08) [1]
Удалить из таблицы PC компьютеры, имеющие минимальный объем диска или памяти.


```sql
%%sql
DELETE
  FROM pc
 WHERE hd =
       (SELECT min_hd FROM (SELECT MIN(hd) AS min_hd FROM pc) AS t)
    OR ram =
       (SELECT min_ram FROM (SELECT MIN(ram) AS min_ram FROM pc) AS t2);

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
       mysql+mysqlconnector://root:***@localhost/sql_ex
    5 rows affected.





    []




```sql
%%sql
 WITH min_hd_table AS (
           SELECT MIN(hd) AS min_hd FROM pc),
       min_ram_table AS (
           SELECT MIN(ram) AS min_ram FROM pc)
DELETE
  FROM pc
 WHERE hd = (SELECT min_hd FROM min_hd_table)
    OR ram = (SELECT min_ram FROM min_ram_table);

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
    5 rows affected.





    []



### Задание: 6 (Serge I: 2004-09-08) [1]
Удалить все блокноты, выпускаемые производителями, которые не выпускают принтеры.


```sql
%%sql
DELETE FROM Laptop
WHERE model NOT IN (
	SELECT model FROM Product
	WHERE maker IN (
		SELECT maker FROM Product WHERE type='Printer'))

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
       mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





    []




```sql
%%sql
  WITH not_printer_models AS (
           SELECT model
             FROM Product
            WHERE maker IN
                  (SELECT maker
                     FROM Product
                    WHERE type = 'Printer'))
DELETE
  FROM Laptop
 WHERE model NOT IN
       (SELECT model
          FROM not_printer_models);

```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
    6 rows affected.





    []



### Задание: 10 (Serge I: 2004-09-09) [2]
Добавить в таблицу PC те модели ПК из Product, которые отсутствуют в таблице PC.

При этом модели должны иметь следующие характеристики:

1. Код равен номеру модели плюс максимальный код, который был до вставки.

2. Скорость, объем памяти и диска, а также скорость CD должны иметь максимальные характеристики среди всех имеющихся в таблице PC.

3. Цена должна быть средней среди всех ПК, имевшихся в таблице PC до вставки.


```sql
%%sql
INSERT INTO pc (code, model, speed, ram, hd, cd, price)
SELECT model + (SELECT MAX(code) FROM pc) AS code,
       model,
       (SELECT MAX(speed) FROM pc) AS speed,
       (SELECT MAX(ram) FROM pc) AS ram,
       (SELECT MAX(hd) FROM pc) AS hd,
       CONCAT(
           CAST(
               (SELECT MAX(CAST(SUBSTRING(cd, 1, LENGTH(cd) - 1) AS UNSIGNED))
                FROM pc) AS CHAR
           ), 'x'
       ) AS cd,
       (SELECT AVG(price) FROM pc) AS price
  FROM Product
 WHERE type = 'PC'
   AND model NOT IN
       (SELECT model FROM pc);


```

     * mysql+mysqlconnector://root:***@localhost/dml_computer
       mysql+mysqlconnector://root:***@localhost/sql_ex
    4 rows affected.





    []




```python

```


```python

```


```python

```


```python

```


```python

```
