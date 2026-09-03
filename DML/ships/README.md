# 3. Корабли

Рассматривается БД кораблей, участвовавших во второй мировой войне. Имеются следующие отношения:

- Classes (class, type, country, numGuns, bore, displacement)
- Ships (name, class, launched)
- Battles (name, date)
- Outcomes (ship, battle, result)

Корабли в «классах» построены по одному и тому же проекту, и классу присваивается либо имя первого корабля, построенного по данному проекту, либо названию класса дается имя проекта, которое не совпадает ни с одним из кораблей в БД. Корабль, давший название классу, называется головным.

Отношение Classes содержит имя класса, тип (bb для боевого (линейного) корабля или bc для боевого крейсера), страну, в которой построен корабль, число главных орудий, калибр орудий (диаметр ствола орудия в дюймах) и водоизмещение ( вес в тоннах).

В отношении Ships записаны название корабля, имя его класса и год спуска на воду. В отношение Battles включены название и дата битвы, в которой участвовали корабли.

А в отношении Outcomes – результат участия данного корабля в битве (потоплен-sunk, поврежден - damaged или невредим - OK).

Замечания. 
1) В отношение Outcomes могут входить корабли, отсутствующие в отношении Ships. 
2) Потопленный корабль в последующих битвах участия не принимает.

![image.png](image.png)

### Внимание! Таблицы для DML отличаются от основных

[create_database_dml.sql](./../../databases/create_database.sql) - скрипт для создания ДБ

[ships_dml_script.sql](./../../databases/ships_dml_script.sql) - скрипт для создания "Корабли" DML

### Задание: -3 (Serge I: 2007-03-23) [2]
Заменить любое количество повторяющихся пробелов в названиях кораблей из таблицы Ships на один пробел.


```sql
%%sql
UPDATE Ships
   SET name = REPLACE(REPLACE(REPLACE(name, '  ', ' *'), '* ', ''), '*', '');
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex_dml
    20 rows affected.





    []



### Задание: -7 (Serge I: 2004-09-09) [2]
Ввести в базу данных информацию о том, что корабль Rodney был потоплен в битве, произошедшей 25/10/1944, а корабль Nelson поврежден - 28/01/1945.
Замечание: считать, что дата битвы уникальна в таблице Battles.


```sql
%%sql
INSERT INTO outcomes (ship, battle, result)
SELECT 'Rodney', name, 'sunk'
  FROM battles
 WHERE CONVERT(VARCHAR(10), date, 103) = '25/10/1944'

 UNION

SELECT 'Nelson', name, 'damaged'
  FROM battles
 WHERE CONVERT(VARCHAR(10), date, 103) = '28/01/1945';

```

### Задание: -8 (Serge I: 2004-09-08) [1]
Измените данные в таблице Classes так, чтобы калибры орудий измерялись в
сантиметрах (1 дюйм=2,5см), а водоизмещение в метрических тоннах (1
метрическая тонна = 1,1 тонны). Водоизмещение вычислить с точностью до
целых.


```sql
%%sql
UPDATE Classes
   SET bore = bore * 2.5,
       displacement = ROUND(displacement / 1.1, 0);

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex_dml
    8 rows affected.





    []



### Задание: 7 (Serge I: 2005-03-05) [1]
Для кораблей, которые принимали участие всего в двух сражениях, поменять результаты (result) этих сражений.

Например, если в битве 1 результат был "ok", а в битве 2 - "sunk", то должно стать "ok" для битвы 2 и "sunk" - для битвы 1.


```sql
%%sql
UPDATE outcomes
   SET result = (SELECT o2.result
                   FROM (SELECT *
                           FROM Outcomes) AS o2
                  WHERE o2.ship = Outcomes.ship
                    AND o2.battle <> Outcomes.battle)
 WHERE ship IN
       (SELECT ship
          FROM (SELECT *
                  FROM Outcomes) AS o
         GROUP BY ship
        HAVING COUNT(battle) = 2);

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex_dml
    0 rows affected.





    []



### Задание: 8 (Serge I: 2004-09-08) [1]
Удалите из таблицы Ships все корабли, потопленные в сражениях.


```sql
%%sql
DELETE
  FROM Ships
 WHERE name IN
       (SELECT ship
          FROM Outcomes
         WHERE result = 'sunk');

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex_dml
    1 rows affected.





    []



### Задание: 9 (Serge I: 2015-12-21) [1]
Перенести все концевые пробелы, имеющиеся в названии каждого сражения в таблице Battles, в начало названия.


```sql
%%sql
UPDATE battles
   SET name = CONCAT(REPLACE(name, RTRIM(name), ''), RTRIM(name));
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex_dml
    5 rows affected.





    []



### Задание: 12 (: ) [2]
Добавить отсутствующие в таблице Ships головные корабли из Outcomes. Годом спуска на воду считать средний округленный до целого числа год по кораблям страны добавляемого корабля. Если средний год неизвестен, запись не вносить.


```sql
%%sql
  WITH country_avg_launched AS (
           SELECT c.country,
                  ROUND(AVG(CAST(s.launched AS FLOAT)), 0) AS avg_launched
             FROM classes AS c
             JOIN ships AS s
               ON s.class = c.class
            GROUP BY c.country),
       outcomes_ships AS (
           SELECT DISTINCT o.ship, c.class, c.country
             FROM outcomes AS o
             JOIN classes AS c
               ON o.ship = c.class
            WHERE o.ship NOT IN
                  (SELECT name
                     FROM ships))
INSERT INTO ships (name, class, launched)
SELECT outcomes_ships.ship,
       outcomes_ships.class,
       country_avg_launched.avg_launched
  FROM outcomes_ships
  JOIN country_avg_launched AS country_avg_launched
    ON country_avg_launched.country = outcomes_ships.country
 WHERE country_avg_launched.avg_launched IS NOT NULL;
```

### Задание: 13 (: ) [2]
Потопить в следующем сражении суда, которые в первой своей битве были повреждены и больше не участвовали ни в каких сражениях. Если следующего сражения для такого судна не существует в базе данных, не вносить его в таблицу Outcomes. Замечание: в базе данных нет двух сражений, которые состоялись бы в один день.


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


```python

```


```python

```
