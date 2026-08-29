USE dml_computer;

DROP TABLE IF EXISTS Printer;

DROP TABLE IF EXISTS Laptop;

DROP TABLE IF EXISTS pc;

DROP TABLE IF EXISTS Product;

CREATE TABLE Product (
    maker CHAR(1)    NOT NULL,
    model VARCHAR(4) NOT NULL,
    type  VARCHAR(7) NOT NULL,
    PRIMARY KEY (model)
) ENGINE = InnoDB;

CREATE TABLE Laptop (
    code   INT             NOT NULL,
    model  VARCHAR(4)      NOT NULL,
    speed  SMALLINT        NOT NULL,
    ram    SMALLINT        NOT NULL DEFAULT 64,
    hd     REAL            NOT NULL DEFAULT 20,
    price  DECIMAL(10, 2)  DEFAULT NULL,
    screen TINYINT         NOT NULL DEFAULT 14,
    PRIMARY KEY (code),
           CONSTRAINT FK_Laptop_product
           FOREIGN KEY (model)
           REFERENCES Product (model)
) ENGINE = InnoDB;

CREATE TABLE pc (
    code  INT             NOT NULL,
    model VARCHAR(4)      NOT NULL,
    speed SMALLINT        NOT NULL,
    ram   SMALLINT        NOT NULL DEFAULT 128,
    hd    REAL            NOT NULL DEFAULT 40,
    cd    VARCHAR(10)     NOT NULL DEFAULT '40x',
    price DECIMAL(10, 2)  DEFAULT NULL,
    PRIMARY KEY (code),
          CONSTRAINT FK_pc_product
          FOREIGN KEY (model)
          REFERENCES Product (model)
) ENGINE = InnoDB;

CREATE TABLE Printer (
    code  INT             NOT NULL,
    model VARCHAR(4)      NOT NULL,
    color CHAR(1)         NOT NULL DEFAULT 'y',
    type  VARCHAR(6)      NOT NULL DEFAULT 'Jet',
    price DECIMAL(10, 2)  DEFAULT NULL,
    PRIMARY KEY (code),
          CONSTRAINT FK_printer_product
          FOREIGN KEY (model)
          REFERENCES Product (model)
) ENGINE = InnoDB;

INSERT INTO Product
VALUES ('B', '1121', 'PC');

INSERT INTO Product
VALUES ('A', '1232', 'PC');

INSERT INTO Product
VALUES ('A', '1233', 'PC');

INSERT INTO Product
VALUES ('E', '1260', 'PC');

INSERT INTO Product
VALUES ('A', '1276', 'Printer');

INSERT INTO Product
VALUES ('D', '1288', 'Printer');

INSERT INTO Product
VALUES ('A', '1298', 'Laptop');

INSERT INTO Product
VALUES ('C', '1321', 'Laptop');

INSERT INTO Product
VALUES ('A', '1401', 'Printer');

INSERT INTO Product
VALUES ('A', '1408', 'Printer');

INSERT INTO Product
VALUES ('D', '1433', 'Printer');

INSERT INTO Product
VALUES ('E', '1434', 'Printer');

INSERT INTO Product
VALUES ('B', '1750', 'Laptop');

INSERT INTO Product
VALUES ('A', '1752', 'Laptop');

INSERT INTO Product
VALUES ('E', '2112', 'PC');

INSERT INTO Product
VALUES ('E', '2113', 'PC');

# 0001
INSERT INTO product (maker, model, type)
VALUES ('A', 2111, 'PC');

# 0002, -0005
INSERT INTO product (maker, model, type)
VALUES ('E', '4444', 'PC');

INSERT INTO pc
VALUES (1, '1232', 500, 64, 5, '12x', 600.00);

INSERT INTO pc
VALUES (2, '1121', 750, 128, 14, '40x', 850.00);

INSERT INTO pc
VALUES (3, '1233', 500, 64, 5, '12x', 600.00);

INSERT INTO pc
VALUES (4, '1121', 600, 128, 14, '40x', 850.00);

INSERT INTO pc
VALUES (5, '1121', 600, 128, 8, '40x', 850.00);

INSERT INTO pc
VALUES (6, '1233', 750, 128, 20, '50x', 950.00);

INSERT INTO pc
VALUES (7, '1232', 500, 32, 10, '12x', 400.00);

INSERT INTO pc
VALUES (8, '1232', 450, 64, 8, '24x', 350.00);

INSERT INTO pc
VALUES (9, '1232', 450, 32, 10, '24x', 350.00);

INSERT INTO pc
VALUES (10, '1260', 500, 32, 10, '12x', 350.00);

INSERT INTO pc
VALUES (11, '1233', 900, 128, 40, '40x', 980.00);

INSERT INTO pc
VALUES (12, '1233', 800, 128, 20, '50x', 970.00);

INSERT INTO Laptop
VALUES (1, '1298', 350, 32, 4, 700.00, 11);

INSERT INTO Laptop
VALUES (2, '1321', 500, 64, 8, 970.00, 12);

INSERT INTO Laptop
VALUES (3, '1750', 750, 128, 12, 1200.00, 14);

INSERT INTO Laptop
VALUES (4, '1298', 600, 64, 10, 1050.00, 15);

INSERT INTO Laptop
VALUES (5, '1752', 750, 128, 10, 1150.00, 14);

INSERT INTO Laptop
VALUES (6, '1298', 450, 64, 10, 950.00, 12);

INSERT INTO Printer
VALUES (1, '1276', 'n', 'Laser', 400.00);

INSERT INTO Printer
VALUES (2, '1433', 'y', 'Jet', 270.00);

INSERT INTO Printer
VALUES (3, '1434', 'y', 'Jet', 290.00);

INSERT INTO Printer
VALUES (4, '1401', 'n', 'Matrix', 150.00);

INSERT INTO Printer
VALUES (5, '1408', 'n', 'Matrix', 270.00);

INSERT INTO Printer
VALUES (6, '1288', 'n', 'Laser', 400.00);
