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




```python

```


```python

```
