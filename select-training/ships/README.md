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



### Задание: 47 (Serge I: 2019-06-07) [2]
Определить страны, которые потеряли в сражениях все свои корабли.


```sql
%%sql
  WITH all_ships AS (
           SELECT country, name
             FROM classes
             JOIN ships
               ON classes.class = ships.class

            UNION

           SELECT country, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship),
/* number of sunked ships */
       sunked_ships AS (
           SELECT country, COUNT(*) AS total
             FROM all_ships
                  LEFT JOIN outcomes
                  ON all_ships.name = outcomes.ship
            WHERE result = 'sunk'
            GROUP BY country),
/* total number of ships */
       ships_count_table AS (
           SELECT country, COUNT(*) AS total
             FROM all_ships
            GROUP BY country)
SELECT ships_count_table.country
  FROM ships_count_table
  JOIN sunked_ships
    ON ships_count_table.country = sunked_ships.country
 WHERE ships_count_table.total = sunked_ships.total;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>country</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Germany</td>
        </tr>
    </tbody>
</table>



### Задание: 48 (Serge I: 2003-02-16) [1]
Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.


```sql
%%sql
  WITH all_ships AS (
           SELECT classes.class, name
             FROM classes
             JOIN ships
               ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT DISTINCT class
  FROM all_ships
  JOIN outcomes
    ON all_ships.name = outcomes.ship
 WHERE result = 'sunk';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





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
        <tr>
            <td>Kongo</td>
        </tr>
    </tbody>
</table>



### Задание: 49 (Serge I: 2003-02-17) [1]
Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).


```sql
%%sql
  WITH all_ships AS (
           SELECT classes.class, name
             FROM ships
             JOIN classes
               ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT all_ships.name
  FROM all_ships
       LEFT JOIN classes
       ON all_ships.class = classes.class
 WHERE bore = 16;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    7 rows affected.





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
    </tbody>
</table>



### Задание: 50 (Serge I: 2002-11-05) [1]
Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.


```sql
%%sql
SELECT DISTINCT battle
  FROM ships
  JOIN outcomes
    ON ships.name = outcomes.ship
 WHERE ships.class = 'Kongo';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>battle</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Guadalcanal</td>
        </tr>
    </tbody>
</table>



### Задание: 51 (Serge I: 2003-02-17) [2]
Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).


```sql
%%sql
  WITH all_ships AS (
           SELECT classes.class, name, classes.displacement, classes.numGuns
             FROM ships
             JOIN classes
               ON classes.class = ships.class

            UNION

           SELECT class, ship, classes.displacement, classes.numGuns
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship),
       max_numGuns_table AS (
           SELECT classes.displacement AS displacement,
                  MAX(classes.numGuns) AS max_numGuns
             FROM all_ships
             JOIN classes
               ON all_ships.class = classes.class
            GROUP BY classes.displacement)
SELECT DISTINCT all_ships.name
  FROM all_ships
  JOIN max_numGuns_table
    ON all_ships.displacement = max_numGuns_table.displacement
       AND all_ships.numGuns = max_numGuns_table.max_numGuns;
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    16 rows affected.





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
            <td>Ramillies</td>
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
            <td>California</td>
        </tr>
        <tr>
            <td>Tennessee</td>
        </tr>
        <tr>
            <td>Musashi</td>
        </tr>
        <tr>
            <td>Yamato</td>
        </tr>
        <tr>
            <td>Bismarck</td>
        </tr>
    </tbody>
</table>



### Задание: 52 (qwrqwr: 2010-04-23) [2]
Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн


```sql
%%sql
SELECT ships.name
  FROM ships
  JOIN classes
    ON classes.class = ships.class
 WHERE country = 'Japan'
   AND type = 'bb'
   AND (numguns >= 9
        OR numguns IS NULL)
   AND (bore < 19
        OR bore IS NULL)
   AND (displacement <= 65000
        OR displacement IS NULL);

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
            <td>Musashi</td>
        </tr>
        <tr>
            <td>Yamato</td>
        </tr>
    </tbody>
</table>



### Задание: 53 (Serge I: 2002-11-05) [2]
Определите среднее число орудий для классов линейных кораблей.
Получить результат с точностью до 2-х десятичных знаков.



```sql
%%sql
SELECT CAST(AVG(numGuns * 1.0) AS DECIMAL(10, 2)) AS avg_numguns
  FROM classes
 WHERE type = 'bb';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>avg_numguns</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>9.67</td>
        </tr>
    </tbody>
</table>



### Задание: 54 (Serge I: 2003-02-14) [2]
С точностью до 2-х десятичных знаков определите среднее число орудий всех линейных кораблей (учесть корабли из таблицы Outcomes).


```sql
%%sql
  WITH all_ships AS (
           SELECT classes.class, name, classes.type, classes.numGuns
             FROM ships
             JOIN classes
               ON classes.class = ships.class

            UNION

           SELECT class, ship, classes.type, classes.numGuns
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT CAST(AVG(numGuns * 1.0) AS DECIMAL(10, 2)) AS avg_numguns
  FROM all_ships
 WHERE type = 'bb';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>avg_numguns</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>9.63</td>
        </tr>
    </tbody>
</table>



### Задание: 55 (Serge I: 2003-02-16) [1]
Для каждого класса определите год, когда был спущен на воду первый корабль этого класса. Если год спуска на воду головного корабля неизвестен, определите минимальный год спуска на воду кораблей этого класса. Вывести: класс, год.


```sql
%%sql
SELECT classes.class, MIN(launched)
  FROM classes
       LEFT JOIN ships
       ON ships.class = classes.class
 GROUP BY classes.class;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    8 rows affected.





<table>
    <thead>
        <tr>
            <th>class</th>
            <th>MIN(launched)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Bismarck</td>
            <td>None</td>
        </tr>
        <tr>
            <td>Iowa</td>
            <td>1943</td>
        </tr>
        <tr>
            <td>Kongo</td>
            <td>1913</td>
        </tr>
        <tr>
            <td>North Carolina</td>
            <td>1941</td>
        </tr>
        <tr>
            <td>Renown</td>
            <td>1916</td>
        </tr>
        <tr>
            <td>Revenge</td>
            <td>1916</td>
        </tr>
        <tr>
            <td>Tennessee</td>
            <td>1920</td>
        </tr>
        <tr>
            <td>Yamato</td>
            <td>1941</td>
        </tr>
    </tbody>
</table>



### Задание: 56 (Serge I: 2003-02-16) [2]
Для каждого класса определите число кораблей этого класса, потопленных в сражениях. Вывести: класс и число потопленных кораблей.


```sql
%%sql
  WITH all_ships AS (
           SELECT classes.class, name
             FROM classes
                  LEFT JOIN ships
                  ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM classes
                  LEFT JOIN outcomes
                  ON classes.class = outcomes.ship)
SELECT all_ships.class,
       SUM(CASE WHEN result = 'sunk' THEN 1 ELSE 0 END) AS sunk_count
  FROM all_ships
       LEFT JOIN outcomes
       ON all_ships.name = outcomes.ship
 GROUP BY all_ships.class;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    8 rows affected.





<table>
    <thead>
        <tr>
            <th>class</th>
            <th>sunk_count</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Bismarck</td>
            <td>1</td>
        </tr>
        <tr>
            <td>Iowa</td>
            <td>0</td>
        </tr>
        <tr>
            <td>Kongo</td>
            <td>1</td>
        </tr>
        <tr>
            <td>North Carolina</td>
            <td>0</td>
        </tr>
        <tr>
            <td>Renown</td>
            <td>0</td>
        </tr>
        <tr>
            <td>Revenge</td>
            <td>0</td>
        </tr>
        <tr>
            <td>Tennessee</td>
            <td>0</td>
        </tr>
        <tr>
            <td>Yamato</td>
            <td>0</td>
        </tr>
    </tbody>
</table>



### Задание: 57 (Serge I: 2003-02-14) [2]
Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, вывести имя класса и число потопленных кораблей.


```sql
%%sql
  WITH all_classes AS (
           SELECT classes.class, name AS ship_name
             FROM classes
                  LEFT JOIN ships
                  ON classes.class = ships.class

            UNION

           SELECT class, ship AS ship_name
             FROM classes
             JOIN outcomes
               ON classes.class = outcomes.ship),
       all_ships AS (
           SELECT classes.class, name
             FROM ships
                  LEFT JOIN classes
                  ON classes.class = ships.class

            UNION

           SELECT class, ship
             FROM outcomes
             JOIN classes
               ON classes.class = outcomes.ship)
SELECT all_classes.class,
       SUM(CASE WHEN result = 'sunk' THEN 1 ELSE 0 END) AS sunk_count
  FROM all_classes
       LEFT JOIN outcomes
       ON all_classes.ship_name = outcomes.ship
 GROUP BY all_classes.class
HAVING SUM(CASE WHEN result = 'sunk' THEN 1 ELSE 0 END) > 0
   AND (SELECT COUNT(all_ships.name)
          FROM all_ships
         WHERE all_classes.class = all_ships.class
         GROUP BY all_ships.class) >= 3;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>class</th>
            <th>sunk_count</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Kongo</td>
            <td>1</td>
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


```python

```
