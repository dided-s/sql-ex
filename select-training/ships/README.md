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

[computer_mysql_script.sql](./../../databases/ships_mysql_script.sql) - скрипт для создания "Компьютерная фирма"

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




```python

```


```python

```


```python

```
