# 2. Фирма вторсырья

Фирма имеет несколько пунктов приема вторсырья. Каждый пункт получает деньги для их выдачи сдатчикам вторсырья. Сведения о получении денег на пунктах приема записываются в таблицу:

1. Income(code, point, date, inc)
2. Outcome(code, point, date, out)

Income_o(point, date, inc)

Первичным ключом является (point, date). При этом в столбец date записывается только дата (без времени), т.е. прием денег (inc) на каждом пункте производится не чаще одного раза в день. Сведения о выдаче денег сдатчикам вторсырья записываются в таблицу:

Outcome_o(point, date, out)

В этой таблице также первичный ключ (point, date) гарантирует отчетность каждого пункта о выданных деньгах (out) не чаще одного раза в день.
В случае, когда приход и расход денег может фиксироваться несколько раз в день, используется другая схема с таблицами, имеющими первичный ключ code:

Здесь также значения столбца date не содержат времени.

![image.png](image.png)

[create_database.sql](./../../databases/create_database.sql) - скрипт для создания ДБ

[inc_out_mysql_script.sql](./../../databases/inc_out_mysql_script.sql) - скрипт для создания "Фирма вторсырья"

### Задание: 29 (Serge I: 2003-02-14) [2]
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.


```sql
%%sql
SELECT income_o.point, income_o.date, income_o.inc, outcome_o.out
  FROM income_o
       LEFT JOIN outcome_o
       ON income_o.point = outcome_o.point
          AND income_o.date = outcome_o.date

 UNION

SELECT outcome_o.point,
       outcome_o.date, income_o.inc, outcome_o.out
  FROM income_o
       RIGHT JOIN outcome_o
       ON income_o.point = outcome_o.point
          AND income_o.date = outcome_o.date;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    19 rows affected.





<table>
    <thead>
        <tr>
            <th>point</th>
            <th>date</th>
            <th>inc</th>
            <th>out</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>2001-03-22 00:00:00</td>
            <td>15000.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-23 00:00:00</td>
            <td>15000.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-24 00:00:00</td>
            <td>3400.00</td>
            <td>3663.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-13 00:00:00</td>
            <td>5000.00</td>
            <td>4490.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-05-11 00:00:00</td>
            <td>4500.00</td>
            <td>2530.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-22 00:00:00</td>
            <td>10000.00</td>
            <td>1440.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-24 00:00:00</td>
            <td>1500.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2001-09-13 00:00:00</td>
            <td>11500.00</td>
            <td>1500.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2001-10-02 00:00:00</td>
            <td>18000.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-14 00:00:00</td>
            <td>None</td>
            <td>15348.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-26 00:00:00</td>
            <td>None</td>
            <td>1221.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-28 00:00:00</td>
            <td>None</td>
            <td>2075.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-29 00:00:00</td>
            <td>None</td>
            <td>2004.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-11 00:00:00</td>
            <td>None</td>
            <td>3195.04</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-27 00:00:00</td>
            <td>None</td>
            <td>3110.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-29 00:00:00</td>
            <td>None</td>
            <td>7848.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-04-02 00:00:00</td>
            <td>None</td>
            <td>2040.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2001-09-14 00:00:00</td>
            <td>None</td>
            <td>2300.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2002-09-16 00:00:00</td>
            <td>None</td>
            <td>2150.00</td>
        </tr>
    </tbody>
</table>



### Задание: 30 (Serge I: 2003-02-14) [2]
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).


```sql
%%sql
SELECT point, date, SUM(sum_out), SUM(sum_inc)
  FROM (SELECT point,
               date, SUM(inc) AS sum_inc, NULL AS sum_out
          FROM Income
         GROUP BY point, date

         UNION

        SELECT point,
               date, NULL AS sum_inc, SUM(`out`) AS sum_out
          FROM Outcome
         GROUP BY point, date) AS t
 GROUP BY point, date
 ORDER BY point;


```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    17 rows affected.





<table>
    <thead>
        <tr>
            <th>point</th>
            <th>date</th>
            <th>SUM(sum_out)</th>
            <th>SUM(sum_inc)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>2001-03-14 00:00:00</td>
            <td>15348.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-22 00:00:00</td>
            <td>None</td>
            <td>30000.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-23 00:00:00</td>
            <td>None</td>
            <td>15000.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-24 00:00:00</td>
            <td>7163.00</td>
            <td>7000.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-26 00:00:00</td>
            <td>1221.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-28 00:00:00</td>
            <td>2075.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-29 00:00:00</td>
            <td>4010.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-11 00:00:00</td>
            <td>3195.04</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-13 00:00:00</td>
            <td>4490.00</td>
            <td>10000.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-27 00:00:00</td>
            <td>3110.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-05-11 00:00:00</td>
            <td>2530.00</td>
            <td>4500.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-22 00:00:00</td>
            <td>2880.00</td>
            <td>10000.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-24 00:00:00</td>
            <td>None</td>
            <td>3000.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-29 00:00:00</td>
            <td>7848.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-04-02 00:00:00</td>
            <td>2040.00</td>
            <td>None</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2001-09-13 00:00:00</td>
            <td>2700.00</td>
            <td>3100.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2001-09-14 00:00:00</td>
            <td>1150.00</td>
            <td>None</td>
        </tr>
    </tbody>
</table>



### Задание: 59 (Serge I: 2003-02-15) [2]
Посчитать остаток денежных средств на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.


```sql
%%sql
 SELECT point, SUM(union_table.income - union_table.outcome)
  FROM (SELECT income_o.point,
               income_o.date,
               income_o.inc AS income,
               COALESCE(outcome_o.out, 0) AS outcome
          FROM income_o
               LEFT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date

         UNION

        SELECT outcome_o.point,
               outcome_o.date,
               COALESCE(income_o.inc, 0),
               outcome_o.out
          FROM income_o
               RIGHT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date) AS union_table
 GROUP BY union_table.point;
```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    3 rows affected.





<table>
    <thead>
        <tr>
            <th>point</th>
            <th>SUM(union_table.income - union_table.outcome)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>5263.96</td>
        </tr>
        <tr>
            <td>2</td>
            <td>172.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>23550.00</td>
        </tr>
    </tbody>
</table>



### Задание: 60 (Serge I: 2003-02-15) [2]
Посчитать остаток денежных средств на начало дня 15/04/2001 на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.
Замечание. Не учитывать пункты, информации о которых нет до указанной даты.


```sql
%%sql
SELECT point, SUM(union_table.income - union_table.outcome)
  FROM (SELECT income_o.point,
               income_o.date,
               income_o.inc AS income,
               COALESCE(outcome_o.out, 0) AS outcome
          FROM income_o
               LEFT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date

         UNION

        SELECT outcome_o.point,
               outcome_o.date, COALESCE(income_o.inc, 0), outcome_o.out
          FROM income_o
               RIGHT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date) AS union_table
 WHERE date < '2001-04-15'
 GROUP BY union_table.point;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    2 rows affected.





<table>
    <thead>
        <tr>
            <th>point</th>
            <th>SUM(union_table.income - union_table.outcome)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>6403.96</td>
        </tr>
        <tr>
            <td>2</td>
            <td>172.00</td>
        </tr>
    </tbody>
</table>



### Задание: 61 (Serge I: 2003-02-14) [1]
Посчитать остаток денежных средств на всех пунктах приема для базы данных с отчетностью не чаще одного раза в день.


```sql
%%sql
SELECT SUM(union_table.income - union_table.outcome)
  FROM (SELECT income_o.point,
               income_o.date,
               income_o.inc AS income,
               COALESCE(outcome_o.out, 0) AS outcome
          FROM income_o
               LEFT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date

         UNION

        SELECT outcome_o.point,
               outcome_o.date, COALESCE(income_o.inc, 0), outcome_o.out
          FROM income_o
               RIGHT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date) AS union_table;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>SUM(union_table.income - union_table.outcome)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>28985.96</td>
        </tr>
    </tbody>
</table>



### Задание: 62 (Serge I: 2003-02-15) [1]
Посчитать остаток денежных средств на всех пунктах приема на начало дня 15/04/2001 для базы данных с отчетностью не чаще одного раза в день.


```sql
%%sql
SELECT SUM(union_table.income - union_table.outcome)
  FROM (SELECT income_o.point,
               income_o.date,
               income_o.inc AS income,
               COALESCE(outcome_o.out, 0) AS outcome
          FROM income_o
               LEFT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date

         UNION

        SELECT outcome_o.point,
               outcome_o.date, COALESCE(income_o.inc, 0), outcome_o.out
          FROM income_o
               RIGHT JOIN outcome_o
               ON income_o.point = outcome_o.point
                  AND income_o.date = outcome_o.date) AS union_table
 WHERE date < '2001-04-15';

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    1 rows affected.





<table>
    <thead>
        <tr>
            <th>SUM(union_table.income - union_table.outcome)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>6575.96</td>
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


```python

```


```python

```


```python

```
