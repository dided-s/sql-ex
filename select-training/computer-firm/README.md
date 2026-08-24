```python
import sys
!{sys.executable} -m pip install ipython-sql sqlalchemy mysql-connector-python
```

    Collecting ipython-sql
      Downloading ipython_sql-0.5.0-py3-none-any.whl.metadata (17 kB)
    Collecting sqlalchemy
      Downloading sqlalchemy-2.0.52-cp313-cp313-win_amd64.whl.metadata (9.9 kB)
    Requirement already satisfied: mysql-connector-python in c:\Users\konick\AppData\Local\Programs\Python\Python313\Lib\site-packages (26.7.0)
    Collecting prettytable (from ipython-sql)
      Downloading prettytable-3.18.0-py3-none-any.whl.metadata (37 kB)
    Requirement already satisfied: ipython in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython-sql) (9.16.1)
    Collecting sqlparse (from ipython-sql)
      Downloading sqlparse-0.6.0-py3-none-any.whl.metadata (6.0 kB)
    Requirement already satisfied: six in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython-sql) (1.17.0)
    Collecting ipython-genutils (from ipython-sql)
      Downloading ipython_genutils-0.2.0-py2.py3-none-any.whl.metadata (755 bytes)
    Collecting greenlet>=1 (from sqlalchemy)
      Downloading greenlet-3.5.5-cp313-cp313-win_amd64.whl.metadata (3.9 kB)
    Requirement already satisfied: typing-extensions>=4.6.0 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from sqlalchemy) (4.16.0)
    Requirement already satisfied: colorama>=0.4.4 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (0.4.6)
    Requirement already satisfied: ipython-pygments-lexers>=1.0.0 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (1.1.1)
    Requirement already satisfied: jedi>=0.18.2 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (0.20.0)
    Requirement already satisfied: matplotlib-inline>=0.1.6 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (0.2.2)
    Requirement already satisfied: prompt_toolkit<3.1.0,>=3.0.41 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (3.0.53)
    Requirement already satisfied: psutil>=7 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (7.2.2)
    Requirement already satisfied: pygments>=2.14.0 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (2.21.0)
    Requirement already satisfied: stack_data>=0.6.0 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (0.6.3)
    Requirement already satisfied: traitlets>=5.13.0 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from ipython->ipython-sql) (5.16.1)
    Requirement already satisfied: wcwidth>=0.1.4 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from prompt_toolkit<3.1.0,>=3.0.41->ipython->ipython-sql) (0.8.2)
    Requirement already satisfied: parso<0.9.0,>=0.8.6 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from jedi>=0.18.2->ipython->ipython-sql) (0.8.7)
    Requirement already satisfied: executing>=1.2.0 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from stack_data>=0.6.0->ipython->ipython-sql) (2.2.1)
    Requirement already satisfied: asttokens>=2.1.0 in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from stack_data>=0.6.0->ipython->ipython-sql) (3.0.2)
    Requirement already satisfied: pure-eval in C:\Users\konick\AppData\Roaming\Python\Python313\site-packages (from stack_data>=0.6.0->ipython->ipython-sql) (0.2.3)
    Downloading ipython_sql-0.5.0-py3-none-any.whl (20 kB)
    Downloading sqlalchemy-2.0.52-cp313-cp313-win_amd64.whl (2.2 MB)
       ---------------------------------------- 0.0/2.2 MB ? eta -:--:--
       ---- ----------------------------------- 0.3/2.2 MB ? eta -:--:--
       --------- ------------------------------ 0.5/2.2 MB 2.1 MB/s eta 0:00:01
       ------------------- -------------------- 1.0/2.2 MB 2.2 MB/s eta 0:00:01
       ----------------------------- ---------- 1.6/2.2 MB 2.2 MB/s eta 0:00:01
       ---------------------------------- ----- 1.8/2.2 MB 2.2 MB/s eta 0:00:01
       ---------------------------------------- 2.2/2.2 MB 2.1 MB/s  0:00:01
    Downloading greenlet-3.5.5-cp313-cp313-win_amd64.whl (324 kB)
    Downloading ipython_genutils-0.2.0-py2.py3-none-any.whl (26 kB)
    Downloading prettytable-3.18.0-py3-none-any.whl (37 kB)
    Downloading sqlparse-0.6.0-py3-none-any.whl (50 kB)
    Installing collected packages: ipython-genutils, sqlparse, prettytable, greenlet, sqlalchemy, ipython-sql
    
       ---------------------------------------- 0/6 [ipython-genutils]
       ------ --------------------------------- 1/6 [sqlparse]
       ------ --------------------------------- 1/6 [sqlparse]
       ------ --------------------------------- 1/6 [sqlparse]
       ------------- -------------------------- 2/6 [prettytable]
       -------------------- ------------------- 3/6 [greenlet]
       -------------------- ------------------- 3/6 [greenlet]
       -------------------- ------------------- 3/6 [greenlet]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       -------------------------- ------------- 4/6 [sqlalchemy]
       --------------------------------- ------ 5/6 [ipython-sql]
       ---------------------------------------- 6/6 [ipython-sql]
    
    Successfully installed greenlet-3.5.5 ipython-genutils-0.2.0 ipython-sql-0.5.0 prettytable-3.18.0 sqlalchemy-2.0.52 sqlparse-0.6.0



```python
%load_ext sql
%sql mysql+mysqlconnector://root:02915678@localhost/sql_ex
```

    The sql extension is already loaded. To reload it, use:
      %reload_ext sql



```python
connection_string = "mysql+mysqlconnector://root:02915678@localhost/sql_ex"
%sql $connection_string
```


```python
%config SqlMagic.style = '_DEPRECATED_DEFAULT'
```

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

![computer database](image.png)

### Задание: 1 (Serge I: 2002-09-30) [1]
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd


```sql
%%sql
SELECT model, speed, hd
  FROM pc
 WHERE price < 500
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    4 rows affected.





<table>
    <thead>
        <tr>
            <th>model</th>
            <th>speed</th>
            <th>hd</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1232</td>
            <td>500</td>
            <td>10.0</td>
        </tr>
        <tr>
            <td>1232</td>
            <td>450</td>
            <td>8.0</td>
        </tr>
        <tr>
            <td>1232</td>
            <td>450</td>
            <td>10.0</td>
        </tr>
        <tr>
            <td>1260</td>
            <td>500</td>
            <td>10.0</td>
        </tr>
    </tbody>
</table>



### Задание: 2 (Serge I: 2002-09-21) [1]
Найдите производителей принтеров. Вывести: maker


```sql
%%sql
SELECT DISTINCT maker
  FROM Product
 WHERE type = 'Printer';
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A</td>
        </tr>
        <tr>
            <td>D</td>
        </tr>
        <tr>
            <td>E</td>
        </tr>
    </tbody>
</table>



### Задание: 3 (Serge I: 2002-09-30) [1]
Найдите номер модели, объем памяти и размеры экранов ноутбуков, цена которых превышает 1000 дол.


```sql
%%sql
SELECT model, ram, screen
  FROM Laptop
 WHERE price > 1000;
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>model</th>
            <th>ram</th>
            <th>screen</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1750</td>
            <td>128</td>
            <td>14</td>
        </tr>
        <tr>
            <td>1298</td>
            <td>64</td>
            <td>15</td>
        </tr>
        <tr>
            <td>1752</td>
            <td>128</td>
            <td>14</td>
        </tr>
    </tbody>
</table>



### Задание: 4 (Serge I: 2002-09-21) [1]
Найдите все записи таблицы Printer для цветных принтеров.


```sql
%%sql
SELECT *
  FROM Printer
 WHERE color = 'y';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>code</th>
            <th>model</th>
            <th>color</th>
            <th>type</th>
            <th>price</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>2</td>
            <td>1433</td>
            <td>y</td>
            <td>Jet</td>
            <td>270.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>1434</td>
            <td>y</td>
            <td>Jet</td>
            <td>290.00</td>
        </tr>
    </tbody>
</table>



### Задание: 5 (Serge I: 2002-09-30) [1]
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.


```sql
%%sql
SELECT model, speed, hd
  FROM pc
 WHERE cd IN ('12x', '24x')
   AND price < 600;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    4 rows affected.





<table>
    <thead>
        <tr>
            <th>model</th>
            <th>speed</th>
            <th>hd</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1232</td>
            <td>500</td>
            <td>10.0</td>
        </tr>
        <tr>
            <td>1232</td>
            <td>450</td>
            <td>8.0</td>
        </tr>
        <tr>
            <td>1232</td>
            <td>450</td>
            <td>10.0</td>
        </tr>
        <tr>
            <td>1260</td>
            <td>500</td>
            <td>10.0</td>
        </tr>
    </tbody>
</table>



### Задание: 6 (Serge I: 2002-10-28) [2]
Для каждого производителя, выпускающего ноутбуки c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ноутбуков. Вывод: производитель, скорость.


```sql
%%sql
SELECT DISTINCT maker, speed
  FROM Product
  JOIN Laptop
    ON Product.model = Laptop.model
 WHERE type = 'Laptop'
   AND hd >= 10;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    4 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
            <th>speed</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>B</td>
            <td>750</td>
        </tr>
        <tr>
            <td>A</td>
            <td>600</td>
        </tr>
        <tr>
            <td>A</td>
            <td>750</td>
        </tr>
        <tr>
            <td>A</td>
            <td>450</td>
        </tr>
    </tbody>
</table>



### Задание: 7 (Serge I: 2002-11-02) [2]
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).


```sql
%%sql
SELECT DISTINCT Product.model, price
  FROM pc
  JOIN Product
    ON Product.model = pc.model
 WHERE maker = 'B'

 UNION

SELECT DISTINCT Product.model, price
  FROM Laptop
  JOIN Product
    ON Product.model = Laptop.model
 WHERE maker = 'B'

 UNION

SELECT DISTINCT Product.model, price
  FROM Printer
  JOIN Product
    ON Product.model = Printer.model
 WHERE maker = 'B';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>model</th>
            <th>price</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1121</td>
            <td>850.00</td>
        </tr>
        <tr>
            <td>1750</td>
            <td>1200.00</td>
        </tr>
    </tbody>
</table>



### Задание: 8 (Serge I: 2003-02-03) [2]
Найдите производителя, выпускающего ПК, но не ноутбуки.


```sql
%%sql

SELECT maker
  FROM Product
 WHERE type = 'PC'

EXCEPT

SELECT maker
  FROM Product
 WHERE type = 'Laptop';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>E</td>
        </tr>
    </tbody>
</table>



### Задание: 9 (Serge I: 2002-11-02) [1]
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker


```sql
%%sql
SELECT DISTINCT maker
  FROM Product
  JOIN pc
    ON Product.model = pc.model
 WHERE speed >= 450;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A</td>
        </tr>
        <tr>
            <td>B</td>
        </tr>
        <tr>
            <td>E</td>
        </tr>
    </tbody>
</table>



### Задание: 10 (Serge I: 2002-09-23) [1]
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price


```sql
%%sql
SELECT model, price
  FROM Printer
 WHERE price = (SELECT MAX(price)
                  FROM Printer);

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>model</th>
            <th>price</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1276</td>
            <td>400.00</td>
        </tr>
        <tr>
            <td>1288</td>
            <td>400.00</td>
        </tr>
    </tbody>
</table>



### Задание: 11 (Serge I: 2002-11-02) [1]
Найдите среднюю скорость ПК.


```sql
%%sql
SELECT AVG(speed)
  FROM pc;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>AVG(speed)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>608.3333</td>
        </tr>
    </tbody>
</table>



### Задание: 12 (Serge I: 2002-11-02) [1]
Найдите среднюю скорость ноутбуков, цена которых превышает 1000 дол.



```sql
%%sql
SELECT AVG(speed)
  FROM Laptop
 WHERE price > 1000;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>AVG(speed)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>700.0000</td>
        </tr>
    </tbody>
</table>



### Задание: 13 (Serge I: 2002-11-02) [1]
Найдите среднюю скорость ПК, выпущенных производителем A.


```sql
%%sql
SELECT AVG(speed)
  FROM pc
  JOIN Product
    ON pc.model = Product.model
 WHERE maker = 'A';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>AVG(speed)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>606.2500</td>
        </tr>
    </tbody>
</table>



### Задание: 15 (Serge I: 2003-02-03) [1]
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD


```sql
%%sql
SELECT hd
  FROM pc
 GROUP BY hd
HAVING COUNT(hd) > 1;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    5 rows affected.





<table>
    <thead>
        <tr>
            <th>hd</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>5.0</td>
        </tr>
        <tr>
            <td>14.0</td>
        </tr>
        <tr>
            <td>8.0</td>
        </tr>
        <tr>
            <td>20.0</td>
        </tr>
        <tr>
            <td>10.0</td>
        </tr>
    </tbody>
</table>



### Задание: 16 (Serge I: 2003-02-03) [2]
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.


```sql
%%sql
SELECT DISTINCT pc1.model, pc2.model, pc1.speed, pc1.ram
  FROM pc AS pc1
  JOIN pc AS pc2
    ON pc1.speed = pc2.speed
       AND pc1.ram = pc2.ram
 WHERE pc1.model > pc2.model;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>model</th>
            <th>model_1</th>
            <th>speed</th>
            <th>ram</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1233</td>
            <td>1232</td>
            <td>500</td>
            <td>64</td>
        </tr>
        <tr>
            <td>1233</td>
            <td>1121</td>
            <td>750</td>
            <td>128</td>
        </tr>
        <tr>
            <td>1260</td>
            <td>1232</td>
            <td>500</td>
            <td>32</td>
        </tr>
    </tbody>
</table>



### Задание: 17 (Serge I: 2003-02-03) [2]
Найдите модели ноутбуков, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed



```sql
%%sql
SELECT DISTINCT 'Laptop' AS type, model, speed
  FROM Laptop
 WHERE speed < (SELECT MIN(speed)
                  FROM pc);

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>type</th>
            <th>model</th>
            <th>speed</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Laptop</td>
            <td>1298</td>
            <td>350</td>
        </tr>
    </tbody>
</table>



### Задание: 18 (Serge I: 2003-02-03) [2]
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price


```sql
%%sql
SELECT DISTINCT maker, price
  FROM Printer
  JOIN Product
    ON Printer.model = Product.model
 WHERE color = 'y'
   AND price =
       (SELECT MIN(price)
          FROM Printer
         WHERE color = 'y');

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
            <th>price</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>D</td>
            <td>270.00</td>
        </tr>
    </tbody>
</table>



### Задание: 19 (Serge I: 2003-02-13) [1]
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ноутбуков.
Вывести: maker, средний размер экрана.


```sql
%%sql
SELECT maker, AVG(screen)
  FROM Product
  JOIN Laptop
    ON Product.model = Laptop.model
 GROUP BY maker;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
            <th>AVG(screen)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A</td>
            <td>13.0000</td>
        </tr>
        <tr>
            <td>C</td>
            <td>12.0000</td>
        </tr>
        <tr>
            <td>B</td>
            <td>14.0000</td>
        </tr>
    </tbody>
</table>



### Задание: 20 (Serge I: 2003-02-13) [2]
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.


```sql
%%sql
SELECT maker, COUNT(*)
  FROM Product
 WHERE type = 'PC'
 GROUP BY maker
HAVING COUNT(*) >= 3;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
            <th>COUNT(*)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>E</td>
            <td>3</td>
        </tr>
    </tbody>
</table>



### Задание: 21 (Serge I: 2003-02-13) [1]
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.


```sql
%%sql
SELECT maker, MAX(price)
  FROM pc
  JOIN Product
    ON Product.model = pc.model
 GROUP BY maker;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
            <th>MAX(price)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A</td>
            <td>980.00</td>
        </tr>
        <tr>
            <td>B</td>
            <td>850.00</td>
        </tr>
        <tr>
            <td>E</td>
            <td>350.00</td>
        </tr>
    </tbody>
</table>



### Задание: 22 (Serge I: 2003-02-13) [1]
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.


```sql
%%sql
SELECT speed, AVG(price)
  FROM pc
 WHERE speed > 600
 GROUP BY speed;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>speed</th>
            <th>AVG(price)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>750</td>
            <td>900.000000</td>
        </tr>
        <tr>
            <td>900</td>
            <td>980.000000</td>
        </tr>
        <tr>
            <td>800</td>
            <td>970.000000</td>
        </tr>
    </tbody>
</table>



### Задание: 23 (Serge I: 2003-02-14) [2]
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ноутбуки со скоростью не менее 750 МГц.

Вывести: Maker


```sql
%%sql
SELECT maker
  FROM Product
  JOIN pc
    ON Product.model = pc.model
 WHERE speed >= 750

INTERSECT

SELECT maker
  FROM Product
  JOIN Laptop
    ON Product.model = Laptop.model
 WHERE speed >= 750;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>B</td>
        </tr>
        <tr>
            <td>A</td>
        </tr>
    </tbody>
</table>



### Задание: 24 (Serge I: 2003-02-03) [2]
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.


```sql
%%sql
  WITH all_prices AS (
           SELECT model, price
             FROM pc

            UNION

           SELECT model, price
             FROM Laptop

            UNION

           SELECT model, price
             FROM Printer)
SELECT Product.model
  FROM Product
  JOIN all_prices
    ON Product.model = all_prices.model
 WHERE price = (SELECT MAX(price)
                  FROM all_prices);

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>model</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1750</td>
        </tr>
    </tbody>
</table>



### Задание: 25 (Serge I: 2003-02-14) [2]
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker


```sql
%%sql
     WITH PC_ram_table AS (
              SELECT maker
                FROM Product
                JOIN pc
                  ON pc.model = Product.model
               WHERE speed =
                     (SELECT MAX(speed)
                        FROM pc
                       WHERE ram = (SELECT MIN(ram)
                                      FROM pc))
                 AND ram = (SELECT MIN(ram)
                              FROM pc))
SELECT maker
  FROM Product
 WHERE type = 'Printer'

INTERSECT

SELECT *
  FROM PC_ram_table;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A</td>
        </tr>
        <tr>
            <td>E</td>
        </tr>
    </tbody>
</table>



### Задание: 26 (Serge I: 2003-02-14) [2]
Найдите среднюю цену ПК и ноутбуков, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.


```sql
%%sql
SELECT AVG(price)
  FROM (SELECT price
          FROM pc
          JOIN Product
            ON Product.model = pc.model
         WHERE maker = 'A'

         UNION ALL

        SELECT price
          FROM Laptop
          JOIN Product
            ON Product.model = Laptop.model
         WHERE maker = 'A') AS PC_Laptop_table;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>AVG(price)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>754.166667</td>
        </tr>
    </tbody>
</table>



### Задание: 27 (Serge I: 2003-02-03) [2]
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.


```sql
%%sql
SELECT
	maker,
	AVG(hd)
FROM PC
JOIN Product ON PC.model = Product.model
WHERE maker IN (SELECT maker FROM Product WHERE type = 'Printer')
GROUP BY maker
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>maker</th>
            <th>AVG(hd)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A</td>
            <td>14.75</td>
        </tr>
        <tr>
            <td>E</td>
            <td>10.0</td>
        </tr>
    </tbody>
</table>



### Задание: 28 (Serge I: 2012-05-04) [1]
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.


```sql
%%sql
SELECT
	COUNT(*)
FROM (
	SELECT
		maker
	FROM Product
	GROUP BY maker
	HAVING COUNT(model) = 1
) as maker_one_model_count
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>COUNT(*)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
        </tr>
    </tbody>
</table>



### Задание: 97 (qwrqwr: 2013-02-15) [2]
Отобрать из таблицы Laptop те строки, для которых выполняется следующее условие:
значения из столбцов speed, ram, price, screen возможно расположить таким образом, что каждое последующее значение будет превосходить предыдущее в 2 раза или более.
Замечание: все известные характеристики ноутбуков больше нуля.
Вывод: code, speed, ram, price, screen.



```sql
%%sql
  WITH values_table AS (
    -- Эта таблица объединяет все значения как value, а также сохраняет их code
           SELECT speed AS value, code, 'speed' AS type
             FROM Laptop

            UNION ALL

           SELECT ram, code, 'ram'
             FROM Laptop

            UNION ALL

           SELECT price, code, 'price'
             FROM Laptop

            UNION ALL

           SELECT screen, code, 'screen'
             FROM Laptop)
SELECT Laptop.code, speed, ram, price, screen
  FROM Laptop
  -- Таблица, которая выводит необходимые code
  JOIN (SELECT DISTINCT code
          -- Таблица с оконной функцией, которая сравнивает текущую value и предыдущую
          FROM (SELECT value,
                       code,
                       -- Оконная функция, которая сравнивает текущее значение с его предыдущим. Делит их
			           -- По условию, нам нужно >= 2
                       value/COALESCE(LAG(value) OVER (PARTITION BY code ORDER BY value), 0.1) AS `div`
                  FROM values_table) AS lag_table
         WHERE `div` >= 2
         GROUP BY code
         -- Так как нам нужно, чтобы все значения определенного code соответствовали, то их кол-во должно быть 4
        HAVING COUNT(code) = 4) AS code_table
    ON code_table.code = Laptop.code;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>code</th>
            <th>speed</th>
            <th>ram</th>
            <th>price</th>
            <th>screen</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>350</td>
            <td>32</td>
            <td>700.00</td>
            <td>11</td>
        </tr>
        <tr>
            <td>6</td>
            <td>450</td>
            <td>64</td>
            <td>950.00</td>
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


```python

```
