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
