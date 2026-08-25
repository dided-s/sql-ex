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

[create_database.sql](./../../databases/create_database.sql) - скрипт для создания ДБ

[ships_mysql_script.sql](./../../databases/ships_mysql_script.sql) - скрипт для создания "Корабли"

### Задание: 14 (Serge I: 2002-11-05) [1]
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.


```sql
%%sql
SELECT ships.class, name, country
  FROM classes
  JOIN ships
    ON classes.class = ships.class
 WHERE numGuns >= 10;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    5 rows affected.





<table>
    <thead>
        <tr>
            <th>class</th>
            <th>name</th>
            <th>country</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>North Carolina</td>
            <td>North Carolina</td>
            <td>USA</td>
        </tr>
        <tr>
            <td>North Carolina</td>
            <td>South Dakota</td>
            <td>USA</td>
        </tr>
        <tr>
            <td>North Carolina</td>
            <td>Washington</td>
            <td>USA</td>
        </tr>
        <tr>
            <td>Tennessee</td>
            <td>California</td>
            <td>USA</td>
        </tr>
        <tr>
            <td>Tennessee</td>
            <td>Tennessee</td>
            <td>USA</td>
        </tr>
    </tbody>
</table>



### Задание: 31 (Serge I: 2002-10-22) [1]
Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.


```sql
%%sql
SELECT class, country
  FROM classes
 WHERE bore >= 16;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>class</th>
            <th>country</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Iowa</td>
            <td>USA</td>
        </tr>
        <tr>
            <td>North Carolina</td>
            <td>USA</td>
        </tr>
        <tr>
            <td>Yamato</td>
            <td>Japan</td>
        </tr>
    </tbody>
</table>



### Задание: 32 (Serge I: 2003-02-17) [2]
Одной из характеристик корабля является половина куба калибра его главных орудий (mw). С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных.


```sql
%%sql
  WITH all_ships AS (
           SELECT country, bore, name
             FROM classes
             JOIN ships
               ON classes.class = ships.class

            UNION

           SELECT country, bore, ship
             FROM classes
             JOIN outcomes
               ON classes.class = outcomes.ship)
SELECT country,
       CAST(AVG((bore * bore * bore) / 2) AS DECIMAL(10, 2)) AS mw
  FROM all_ships
 GROUP BY country;
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    4 rows affected.





<table>
    <thead>
        <tr>
            <th>country</th>
            <th>mv</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>USA</td>
            <td>1897.78</td>
        </tr>
        <tr>
            <td>Japan</td>
            <td>1886.67</td>
        </tr>
        <tr>
            <td>Gt.Britain</td>
            <td>1687.50</td>
        </tr>
        <tr>
            <td>Germany</td>
            <td>1687.50</td>
        </tr>
    </tbody>
</table>



### Задание: 33 (Serge I: 2002-11-02) [1]
Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.


```sql
%%sql
SELECT ship
  FROM outcomes
 WHERE result = 'sunk'
   AND battle = 'North Atlantic';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>ship</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Bismarck</td>
        </tr>
        <tr>
            <td>Hood</td>
        </tr>
    </tbody>
</table>



### Задание: 34 (Serge I: 2002-11-04) [2]
По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). Вывести названия кораблей.



```sql
%%sql
SELECT name
  FROM ships
  JOIN classes
    ON ships.class = classes.class
 WHERE type = 'bb'
   AND launched >= 1922
   AND displacement > 35000;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    9 rows affected.





<table>
    <thead>
        <tr>
            <th>name</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Iowa</td>
        </tr>
        <tr>
            <td>Missouri</td>
        </tr>
        <tr>
            <td>New Jersey</td>
        </tr>
        <tr>
            <td>Wisconsin</td>
        </tr>
        <tr>
            <td>North Carolina</td>
        </tr>
        <tr>
            <td>South Dakota</td>
        </tr>
        <tr>
            <td>Washington</td>
        </tr>
        <tr>
            <td>Musashi</td>
        </tr>
        <tr>
            <td>Yamato</td>
        </tr>
    </tbody>
</table>



### Задание: 36 (Serge I: 2003-02-17) [2]
Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).


```sql
%%sql
SELECT classes.class
  FROM classes
  JOIN ships
    ON classes.class = ships.name

 UNION

SELECT classes.class
  FROM classes
  JOIN outcomes
    ON classes.class = outcomes.ship;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    8 rows affected.





<table>
    <thead>
        <tr>
            <th>class</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Iowa</td>
        </tr>
        <tr>
            <td>Kongo</td>
        </tr>
        <tr>
            <td>North Carolina</td>
        </tr>
        <tr>
            <td>Renown</td>
        </tr>
        <tr>
            <td>Revenge</td>
        </tr>
        <tr>
            <td>Tennessee</td>
        </tr>
        <tr>
            <td>Yamato</td>
        </tr>
        <tr>
            <td>Bismarck</td>
        </tr>
    </tbody>
</table>



### Задание: 37 (Serge I: 2003-02-17) [2]
Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).



```sql
%%sql
  WITH all_ships AS (
           SELECT class, name
             FROM ships

            UNION

           SELECT ship, ship
             FROM outcomes
            WHERE outcomes.ship IN (SELECT class
                                      FROM Classes))
SELECT class
  FROM all_ships
 GROUP BY class
HAVING COUNT(class) = 1;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>class</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Bismarck</td>
        </tr>
    </tbody>
</table>



### Задание: 38 (Serge I: 2003-02-19) [1]
Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc').


```sql
%%sql
SELECT country
  FROM classes
 WHERE type = 'bc'

INTERSECT

SELECT country
  FROM classes
 WHERE type = 'bb';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>country</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Japan</td>
        </tr>
        <tr>
            <td>Gt.Britain</td>
        </tr>
    </tbody>
</table>



### Задание: 39 (Serge I: 2003-02-14) [2]
Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.


```sql
%%sql
  WITH outcomes_with_battles AS (
           SELECT *
             FROM outcomes
             JOIN battles
               ON battles.name = outcomes.battle)
SELECT DISTINCT ship
  FROM outcomes_with_battles AS o1
 WHERE EXISTS
       (SELECT *
          FROM outcomes_with_battles AS o2
         WHERE o1.date > o2.date
           AND o2.result = 'damaged'
           AND o1.ship = o2.ship);

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>ship</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>California</td>
        </tr>
    </tbody>
</table>



### Задание: 42 (Serge I: 2002-11-05) [1]
Найдите названия кораблей, потопленных в сражениях, и название сражения, в котором они были потоплены.


```sql
%%sql
SELECT ship, battle
  FROM outcomes
  JOIN battles
    ON battles.name = outcomes.battle
 WHERE result = 'sunk';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    6 rows affected.





<table>
    <thead>
        <tr>
            <th>ship</th>
            <th>battle</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Bismarck</td>
            <td>North Atlantic</td>
        </tr>
        <tr>
            <td>Fuso</td>
            <td>Surigao Strait</td>
        </tr>
        <tr>
            <td>Hood</td>
            <td>North Atlantic</td>
        </tr>
        <tr>
            <td>Kirishima</td>
            <td>Guadalcanal</td>
        </tr>
        <tr>
            <td>Schamhorst</td>
            <td>North Cape</td>
        </tr>
        <tr>
            <td>Yamashiro</td>
            <td>Surigao Strait</td>
        </tr>
    </tbody>
</table>



### Задание: 43 (qwrqwr: 2011-10-28) [2]
Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.


```sql
%%sql
SELECT name
  FROM battles
 WHERE YEAR(date) NOT IN
       (SELECT launched
          FROM ships
         WHERE launched IS NOT NULL);

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>name</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>#Cuba62a</td>
        </tr>
        <tr>
            <td>#Cuba62b</td>
        </tr>
    </tbody>
</table>



### Задание: 44 (Serge I: 2002-12-04) [1]
Найдите названия всех кораблей в базе данных, начинающихся с буквы R.


```sql
%%sql
  WITH all_ships AS (
           SELECT name
             FROM ships

            UNION

           SELECT ship
             FROM outcomes)
SELECT name
  FROM all_ships
 WHERE name LIKE 'R%';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    8 rows affected.





<table>
    <thead>
        <tr>
            <th>name</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Ramillies</td>
        </tr>
        <tr>
            <td>Renown</td>
        </tr>
        <tr>
            <td>Repulse</td>
        </tr>
        <tr>
            <td>Resolution</td>
        </tr>
        <tr>
            <td>Revenge</td>
        </tr>
        <tr>
            <td>Royal Oak</td>
        </tr>
        <tr>
            <td>Royal Sovereign</td>
        </tr>
        <tr>
            <td>Rodney</td>
        </tr>
    </tbody>
</table>



### Задание: 45 (Serge I: 2002-12-04) [1]
Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.


```sql
%%sql
  WITH all_ships AS (
           SELECT name
             FROM ships

            UNION

           SELECT ship
             FROM outcomes)
SELECT name
  FROM all_ships
 WHERE name LIKE '% % %';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>name</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>King George V</td>
        </tr>
        <tr>
            <td>Prince of Wales</td>
        </tr>
        <tr>
            <td>Duke of York</td>
        </tr>
    </tbody>
</table>



### Задание: 46 (Serge I: 2003-02-14) [2]
Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.


```sql
%%sql
SELECT DISTINCT outcomes.ship,
       classes.displacement,
       classes.numGuns
  FROM outcomes
       LEFT JOIN ships
       ON outcomes.ship = ships.name

       LEFT JOIN classes
       ON classes.class = ships.class
          OR classes.class = outcomes.ship
 WHERE battle LIKE 'Guadalcanal';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    4 rows affected.





<table>
    <thead>
        <tr>
            <th>ship</th>
            <th>displacement</th>
            <th>numGuns</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>California</td>
            <td>32000</td>
            <td>12</td>
        </tr>
        <tr>
            <td>Kirishima</td>
            <td>32000</td>
            <td>8</td>
        </tr>
        <tr>
            <td>South Dakota</td>
            <td>37000</td>
            <td>12</td>
        </tr>
        <tr>
            <td>Washington</td>
            <td>37000</td>
            <td>12</td>
        </tr>
    </tbody>
</table>




```python

```


```python

```


```python

```


```python

```
