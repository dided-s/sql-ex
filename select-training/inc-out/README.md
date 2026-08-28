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



### Задание: 64 (Serge I: 2010-06-04) [2]
Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот.
Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день.


```sql
%%sql
SELECT income.point, income.date, 'inc', SUM(income.inc)
  FROM income
       LEFT JOIN outcome
       ON income.point = outcome.point
          AND income.date = outcome.date
 WHERE outcome.code IS NULL
 GROUP BY income.point, income.date

 UNION

SELECT outcome.point, outcome.date, 'out', SUM(outcome.out)
  FROM outcome
       LEFT JOIN income
       ON outcome.point = income.point
          AND outcome.date = income.date
 WHERE income.code IS NULL
 GROUP BY outcome.point, outcome.date;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    12 rows affected.





<table>
    <thead>
        <tr>
            <th>point</th>
            <th>date</th>
            <th>inc</th>
            <th>SUM(income.inc)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>2001-03-22 00:00:00</td>
            <td>inc</td>
            <td>30000.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-23 00:00:00</td>
            <td>inc</td>
            <td>15000.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-24 00:00:00</td>
            <td>inc</td>
            <td>3000.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-14 00:00:00</td>
            <td>out</td>
            <td>15348.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-26 00:00:00</td>
            <td>out</td>
            <td>1221.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-28 00:00:00</td>
            <td>out</td>
            <td>2075.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-03-29 00:00:00</td>
            <td>out</td>
            <td>4010.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-11 00:00:00</td>
            <td>out</td>
            <td>3195.04</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2001-04-27 00:00:00</td>
            <td>out</td>
            <td>3110.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-03-29 00:00:00</td>
            <td>out</td>
            <td>7848.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>2001-04-02 00:00:00</td>
            <td>out</td>
            <td>2040.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2001-09-14 00:00:00</td>
            <td>out</td>
            <td>1150.00</td>
        </tr>
    </tbody>
</table>



### Задание: 69 (Serge I: 2011-01-06) [2]
По таблицам Income и Outcome для каждого пункта приема найти остатки денежных средств на конец каждого дня,
в который выполнялись операции по приходу и/или расходу на данном пункте.
Учесть при этом, что деньги не изымаются, а остатки/задолженность переходят на следующий день.
Вывод: пункт приема, день в формате "dd/mm/yyyy", остатки/задолженность на конец этого дня.


```sql
%%sql
  WITH union_table AS (
           SELECT point, date, income.inc AS money
             FROM income

            UNION ALL

           SELECT point, date, -1 * outcome.out
             FROM outcome)
SELECT DISTINCT point,
       #CONVERT(varchar, CONVERT(DATETIME, union_table.date, 103), 103) AS date,
       DATE_FORMAT(union_table.date, '%d/%m,%Y') AS date,
       (SELECT SUM(u2.money)
          FROM union_table AS u2
         WHERE u2.date <= union_table.date
           AND u2.point = union_table.point) AS cumulative
  FROM union_table
 ORDER BY point;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    17 rows affected.





<table>
    <thead>
        <tr>
            <th>point</th>
            <th>date</th>
            <th>cumulative</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>11/04,2001</td>
            <td>18987.96</td>
        </tr>
        <tr>
            <td>1</td>
            <td>11/05,2001</td>
            <td>23357.96</td>
        </tr>
        <tr>
            <td>1</td>
            <td>13/04,2001</td>
            <td>24497.96</td>
        </tr>
        <tr>
            <td>1</td>
            <td>14/03,2001</td>
            <td>-15348.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>22/03,2001</td>
            <td>14652.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>23/03,2001</td>
            <td>29652.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>24/03,2001</td>
            <td>29489.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>26/03,2001</td>
            <td>28268.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>27/04,2001</td>
            <td>21387.96</td>
        </tr>
        <tr>
            <td>1</td>
            <td>28/03,2001</td>
            <td>26193.00</td>
        </tr>
        <tr>
            <td>1</td>
            <td>29/03,2001</td>
            <td>22183.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>02/04,2001</td>
            <td>232.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>22/03,2001</td>
            <td>7120.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>24/03,2001</td>
            <td>10120.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>29/03,2001</td>
            <td>2272.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>13/09,2001</td>
            <td>400.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>14/09,2001</td>
            <td>-750.00</td>
        </tr>
    </tbody>
</table>



### Задание: 81 (Serge I: 2011-11-25) [2]
Из таблицы Outcome получить все записи за тот месяц (месяцы), с учетом года, в котором суммарное значение расхода (out) было максимальным.


```sql
%%sql
  WITH month_table AS (
           SELECT YEAR(date) AS year,
                  MONTH(date) AS month,
                  SUM(outcome.out) AS sum
             FROM outcome
            GROUP BY YEAR(date), MONTH(date)),
       max_sum_month_table AS (
           SELECT year, month, sum
             FROM month_table
            WHERE sum = (SELECT MAX(sum)
                           FROM month_table))
SELECT outcome.code, outcome.point, outcome.date, outcome.out
  FROM outcome
  JOIN max_sum_month_table
    ON YEAR(outcome.date) = max_sum_month_table.year
       AND MONTH(outcome.date) = max_sum_month_table.month;

```

     * mysql+mysqlconnector://root:***@localhost/sql_ex
    10 rows affected.





<table>
    <thead>
        <tr>
            <th>code</th>
            <th>point</th>
            <th>date</th>
            <th>out</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>1</td>
            <td>2001-03-14 00:00:00</td>
            <td>15348.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>1</td>
            <td>2001-03-24 00:00:00</td>
            <td>3663.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td>1</td>
            <td>2001-03-26 00:00:00</td>
            <td>1221.00</td>
        </tr>
        <tr>
            <td>4</td>
            <td>1</td>
            <td>2001-03-28 00:00:00</td>
            <td>2075.00</td>
        </tr>
        <tr>
            <td>5</td>
            <td>1</td>
            <td>2001-03-29 00:00:00</td>
            <td>2004.00</td>
        </tr>
        <tr>
            <td>10</td>
            <td>2</td>
            <td>2001-03-22 00:00:00</td>
            <td>1440.00</td>
        </tr>
        <tr>
            <td>11</td>
            <td>2</td>
            <td>2001-03-29 00:00:00</td>
            <td>7848.00</td>
        </tr>
        <tr>
            <td>13</td>
            <td>1</td>
            <td>2001-03-24 00:00:00</td>
            <td>3500.00</td>
        </tr>
        <tr>
            <td>14</td>
            <td>2</td>
            <td>2001-03-22 00:00:00</td>
            <td>1440.00</td>
        </tr>
        <tr>
            <td>15</td>
            <td>1</td>
            <td>2001-03-29 00:00:00</td>
            <td>2006.00</td>
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
