USE sql_ex_dml;

DROP TABLE IF EXISTS Outcomes;

DROP TABLE IF EXISTS Ships;

DROP TABLE IF EXISTS Battles;

DROP TABLE IF EXISTS Classes;

CREATE TABLE Battles (
    name   VARCHAR(20) NOT NULL,
    `date` DATETIME    NOT NULL,
    PRIMARY KEY (name)
) ENGINE = InnoDB;

CREATE TABLE Classes (
    class        VARCHAR(20) NOT NULL,
    type         VARCHAR(2)  NOT NULL,
    country      VARCHAR(20) NOT NULL,
    numGuns      TINYINT     NULL,
    bore         REAL        NULL,
    displacement INT         NULL,
    PRIMARY KEY (class)
) ENGINE = InnoDB;

CREATE TABLE Ships (
    name     VARCHAR(20) NOT NULL,
    class    VARCHAR(20) NOT NULL,
    launched SMALLINT    NULL,
    PRIMARY KEY (name),
             CONSTRAINT FK_Ships_Classes
             FOREIGN KEY (class)
             REFERENCES Classes (class)
) ENGINE = InnoDB;

CREATE TABLE Outcomes (
    ship   VARCHAR(20) NOT NULL,
    battle VARCHAR(20) NOT NULL,
    result VARCHAR(10) NOT NULL,
    PRIMARY KEY (ship, battle),
           CONSTRAINT FK_Outcomes_Battles
           FOREIGN KEY (battle)
           REFERENCES Battles (name)
) ENGINE = InnoDB;

INSERT INTO Classes
VALUES ('Bismarck', 'bb', 'Germany', 8, 15, 42000);

INSERT INTO Classes
VALUES ('Iowa', 'bb', 'USA', 9, 16, 46000);

INSERT INTO Classes
VALUES ('Kongo', 'bc', 'Japan', 8, 14, 32000);

INSERT INTO Classes
VALUES ('North Carolina', 'bb', 'USA', 12, 16, 37000);

INSERT INTO Classes
VALUES ('Renown', 'bc', 'Gt.Britain', 6, 15, 32000);

INSERT INTO Classes
VALUES ('Revenge', 'bb', 'Gt.Britain', 8, 15, 29000);

INSERT INTO Classes
VALUES ('Tennessee', 'bb', 'USA', 12, 14, 32000);

INSERT INTO Classes
VALUES ('Yamato', 'bb', 'Japan', 9, 18, 65000);

INSERT INTO Battles
VALUES ('Guadalcanal', '1942-11-15 00:00:00');

INSERT INTO Battles
VALUES ('North Atlantic', '1941-05-25 00:00:00');

INSERT INTO Battles
VALUES ('North Cape', '1943-12-26 00:00:00');

INSERT INTO Battles
VALUES ('Surigao Strait', '1944-10-25 00:00:00');

INSERT INTO Battles
VALUES ('Unreal Battle', '1945-01-28 00:00:00');

INSERT INTO Ships
VALUES ('California', 'Tennessee', 1921);

INSERT INTO Ships
VALUES ('Haruna', 'Kongo', 1916);

INSERT INTO Ships
VALUES ('Hiei', 'Kongo', 1914);

INSERT INTO Ships
VALUES ('Iowa', 'Iowa', 1943);

INSERT INTO Ships
VALUES ('Kirishima', 'Kongo', 1915);

INSERT INTO Ships
VALUES ('Kongo', 'Kongo', 1913);

INSERT INTO Ships
VALUES ('Missouri', 'Iowa', 1944);

INSERT INTO Ships
VALUES ('Musashi', 'Yamato', 1942);

INSERT INTO Ships
VALUES ('New   Jersey', 'Iowa', 1943);

INSERT INTO Ships
VALUES ('North Carolina', 'North Carolina', 1941);

INSERT INTO Ships
VALUES ('Ramillies', 'Revenge', 1917);

INSERT INTO Ships
VALUES ('Renown', 'Renown', 1916);

INSERT INTO Ships
VALUES ('Repulse', 'Renown', 1916);

INSERT INTO Ships
VALUES ('Resolution', 'Renown', 1916);

INSERT INTO Ships
VALUES ('Revenge', 'Revenge', 1916);

INSERT INTO Ships
VALUES ('Royal Oak', 'Revenge', 1916);

INSERT INTO Ships
VALUES ('Royal Sovereign', 'Revenge', 1916);

INSERT INTO Ships
VALUES ('Tennessee', 'Tennessee', 1920);

INSERT INTO Ships
VALUES ('Washington', 'North Carolina', 1941);

INSERT INTO Ships
VALUES ('Wisconsin', 'Iowa', 1944);

INSERT INTO Ships
VALUES ('Yamato', 'Yamato', 1941);

INSERT INTO Outcomes
VALUES ('Bismarck', 'North Atlantic', 'sunk');

INSERT INTO Outcomes
VALUES ('California', 'Surigao Strait', 'ok');

INSERT INTO Outcomes
VALUES ('Duke of York', 'North Cape', 'ok');

INSERT INTO Outcomes
VALUES ('Fuso', 'Surigao Strait', 'sunk');

INSERT INTO Outcomes
VALUES ('Hood', 'North Atlantic', 'sunk');

INSERT INTO Outcomes
VALUES ('King George V', 'North Atlantic', 'ok');

INSERT INTO Outcomes
VALUES ('Kirishima', 'Guadalcanal', 'sunk');

INSERT INTO Outcomes
VALUES ('Prince of Wales', 'North Atlantic', 'damaged');

INSERT INTO Outcomes
VALUES ('Rodney', 'North Atlantic', 'OK');

INSERT INTO Outcomes
VALUES ('Schamhorst', 'North Cape', 'sunk');

INSERT INTO Outcomes
VALUES ('South Dakota', 'Guadalcanal', 'damaged');

INSERT INTO Outcomes
VALUES ('Tennessee', 'Surigao Strait', 'ok');

INSERT INTO Outcomes
VALUES ('Washington', 'Guadalcanal', 'ok');

INSERT INTO Outcomes
VALUES ('West Virginia', 'Surigao Strait', 'ok');

INSERT INTO Outcomes
VALUES ('Yamashiro', 'Surigao Strait', 'sunk');
