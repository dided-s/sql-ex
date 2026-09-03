--select * from company;
DROP TABLE IF EXISTS pass_in_trip;

DROP TABLE IF EXISTS trip;

DROP TABLE IF EXISTS passenger;

DROP TABLE IF EXISTS company;

/* */
CREATE TABLE Company (
    ID_comp INT      NOT NULL,
    name    CHAR(10) NOT NULL
);

CREATE TABLE Pass_in_trip (
    trip_no INT       NOT NULL,
    date    TIMESTAMP NOT NULL,
    ID_psg  INT       NOT NULL,
    place   CHAR(10)  NOT NULL
);

CREATE TABLE Passenger (
    ID_psg INT      NOT NULL,
    name   CHAR(20) NOT NULL
);

CREATE TABLE Trip (
    trip_no   INT       NOT NULL,
    ID_comp   INT       NOT NULL,
    plane     CHAR(10)  NOT NULL,
    town_from CHAR(25)  NOT NULL,
    town_to   CHAR(25)  NOT NULL,
    time_out  TIMESTAMP NOT NULL,
    time_in   TIMESTAMP NOT NULL
);

ALTER TABLE Company
  ADD CONSTRAINT PK2
      PRIMARY KEY (ID_comp);

ALTER TABLE Pass_in_trip
  ADD CONSTRAINT PK_pt
      PRIMARY KEY (trip_no, date, ID_psg);

ALTER TABLE Passenger
  ADD CONSTRAINT PK_psg
      PRIMARY KEY (ID_psg);

ALTER TABLE Trip
  ADD CONSTRAINT PK_t
      PRIMARY KEY (trip_no);

ALTER TABLE Pass_in_trip
  ADD CONSTRAINT FK_Pass_in_trip_Passenger
      FOREIGN KEY (ID_psg)
      REFERENCES Passenger (ID_psg);

ALTER TABLE Pass_in_trip
  ADD CONSTRAINT FK_Pass_in_trip_Trip
      FOREIGN KEY (trip_no)
      REFERENCES Trip (trip_no);

ALTER TABLE Trip
  ADD CONSTRAINT FK_Trip_Company
      FOREIGN KEY (ID_comp)
      REFERENCES Company (ID_comp);

----Company------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Company
VALUES (1, 'Don_avia  ');

INSERT INTO Company
VALUES (2, 'Aeroflot  ');

INSERT INTO Company
VALUES (3, 'Dale_avia ');

INSERT INTO Company
VALUES (4, 'air_France');

INSERT INTO Company
VALUES (5, 'British_AW');


----Passenger------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Passenger
VALUES (1, 'Bruce Willis        ');

INSERT INTO Passenger
VALUES (2, 'George Clooney      ');

INSERT INTO Passenger
VALUES (3, 'Kevin Costner       ');

INSERT INTO Passenger
VALUES (4, 'Donald Sutherland   ');

INSERT INTO Passenger
VALUES (5, 'Jennifer Lopez      ');

INSERT INTO Passenger
VALUES (6, 'Ray Liotta          ');

INSERT INTO Passenger
VALUES (7, 'Samuel L. Jackson   ');

INSERT INTO Passenger
VALUES (8, 'Nikole Kidman       ');

INSERT INTO Passenger
VALUES (9, 'Alan Rickman        ');

INSERT INTO Passenger
VALUES (10, 'Kurt Russell        ');

INSERT INTO Passenger
VALUES (11, 'Harrison Ford       ');

INSERT INTO Passenger
VALUES (12, 'Russell Crowe       ');

INSERT INTO Passenger
VALUES (13, 'Steve Martin        ');

INSERT INTO Passenger
VALUES (14, 'Michael Caine       ');

INSERT INTO Passenger
VALUES (15, 'Angelina Jolie      ');

INSERT INTO Passenger
VALUES (16, 'Mel Gibson          ');

INSERT INTO Passenger
VALUES (17, 'Michael Douglas     ');

INSERT INTO Passenger
VALUES (18, 'John Travolta       ');

INSERT INTO Passenger
VALUES (19, 'Sylvester Stallone  ');

INSERT INTO Passenger
VALUES (20, 'Tommy Lee Jones     ');

INSERT INTO Passenger
VALUES (21, 'Catherine Zeta-Jones');

INSERT INTO Passenger
VALUES (22, 'Antonio Banderas    ');

INSERT INTO Passenger
VALUES (23, 'Kim Basinger        ');

INSERT INTO Passenger
VALUES (24, 'Sam Neill           ');

INSERT INTO Passenger
VALUES (25, 'Gary Oldman         ');

INSERT INTO Passenger
VALUES (26, 'Clint Eastwood      ');

INSERT INTO Passenger
VALUES (27, 'Brad Pitt           ');

INSERT INTO Passenger
VALUES (28, 'Johnny Depp         ');

INSERT INTO Passenger
VALUES (29, 'Pierce Brosnan      ');

INSERT INTO Passenger
VALUES (30, 'Sean Connery        ');

INSERT INTO Passenger
VALUES (31, 'Bruce Willis        ');

INSERT INTO Passenger
VALUES (37, 'Mullah Omar         ');


----Trip------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trip
VALUES (1100, 4, 'Boeing    ', 'Rostov                   ', 'Paris                    ', '19000101 14:30:00.000', '19000101 17:50:00.000');

INSERT INTO Trip
VALUES (1101, 4, 'Boeing    ', 'Paris                    ', 'Rostov                   ', '19000101 08:12:00.000', '19000101 11:45:00.000');

INSERT INTO Trip
VALUES (1123, 3, 'TU-154    ', 'Rostov                   ', 'Vladivostok              ', '19000101 16:20:00.000', '19000101 03:40:00.000');

INSERT INTO Trip
VALUES (1124, 3, 'TU-154    ', 'Vladivostok              ', 'Rostov                   ', '19000101 09:00:00.000', '19000101 19:50:00.000');

INSERT INTO Trip
VALUES (1145, 2, 'IL-86     ', 'Moscow                   ', 'Rostov                   ', '19000101 09:35:00.000', '19000101 11:23:00.000');

INSERT INTO Trip
VALUES (1146, 2, 'IL-86     ', 'Rostov                   ', 'Moscow                   ', '19000101 17:55:00.000', '19000101 20:01:00.000');

INSERT INTO Trip
VALUES (1181, 1, 'TU-134    ', 'Rostov                   ', 'Moscow                   ', '19000101 06:12:00.000', '19000101 08:01:00.000');

INSERT INTO Trip
VALUES (1182, 1, 'TU-134    ', 'Moscow                   ', 'Rostov                   ', '19000101 12:35:00.000', '19000101 14:30:00.000');

INSERT INTO Trip
VALUES (1187, 1, 'TU-134    ', 'Rostov                   ', 'Moscow                   ', '19000101 15:42:00.000', '19000101 17:39:00.000');

INSERT INTO Trip
VALUES (1188, 1, 'TU-134    ', 'Moscow                   ', 'Rostov                   ', '19000101 22:50:00.000', '19000101 00:48:00.000');

INSERT INTO Trip
VALUES (1195, 1, 'TU-154    ', 'Rostov                   ', 'Moscow                   ', '19000101 23:30:00.000', '19000101 01:11:00.000');

INSERT INTO Trip
VALUES (1196, 1, 'TU-154    ', 'Moscow                   ', 'Rostov                   ', '19000101 04:00:00.000', '19000101 05:45:00.000');

INSERT INTO Trip
VALUES (7771, 5, 'Boeing    ', 'London                   ', 'Singapore                ', '19000101 01:00:00.000', '19000101 11:00:00.000');

INSERT INTO Trip
VALUES (7772, 5, 'Boeing    ', 'Singapore                ', 'London                   ', '19000101 12:00:00.000', '19000101 02:00:00.000');

INSERT INTO Trip
VALUES (7773, 5, 'Boeing    ', 'London                   ', 'Singapore                ', '19000101 03:00:00.000', '19000101 13:00:00.000');

INSERT INTO Trip
VALUES (7774, 5, 'Boeing    ', 'Singapore                ', 'London                   ', '19000101 14:00:00.000', '19000101 06:00:00.000');

INSERT INTO Trip
VALUES (7775, 5, 'Boeing    ', 'London                   ', 'Singapore                ', '19000101 09:00:00.000', '19000101 20:00:00.000');

INSERT INTO Trip
VALUES (7776, 5, 'Boeing    ', 'Singapore                ', 'London                   ', '19000101 18:00:00.000', '19000101 08:00:00.000');

INSERT INTO Trip
VALUES (7777, 5, 'Boeing    ', 'London                   ', 'Singapore                ', '19000101 18:00:00.000', '19000101 06:00:00.000');

INSERT INTO Trip
VALUES (7778, 5, 'Boeing    ', 'Singapore                ', 'London                   ', '19000101 22:00:00.000', '19000101 12:00:00.000');

INSERT INTO Trip
VALUES (8881, 5, 'Boeing    ', 'London                   ', 'Paris                    ', '19000101 03:00:00.000', '19000101 04:00:00.000');

INSERT INTO Trip
VALUES (8882, 5, 'Boeing    ', 'Paris                    ', 'London                   ', '19000101 22:00:00.000', '19000101 23:00:00.000');


----Pass_in_trip------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Pass_in_trip
VALUES (1100, '20030429 00:00:00.000', 1, '1a        ');

INSERT INTO Pass_in_trip
VALUES (1123, '20030405 00:00:00.000', 3, '2a        ');

INSERT INTO Pass_in_trip
VALUES (1123, '20030408 00:00:00.000', 1, '4c        ');

INSERT INTO Pass_in_trip
VALUES (1123, '20030408 00:00:00.000', 6, '4b        ');

INSERT INTO Pass_in_trip
VALUES (1124, '20030402 00:00:00.000', 2, '2d        ');

INSERT INTO Pass_in_trip
VALUES (1145, '20030405 00:00:00.000', 3, '2c        ');

INSERT INTO Pass_in_trip
VALUES (1181, '20030401 00:00:00.000', 1, '1a        ');

INSERT INTO Pass_in_trip
VALUES (1181, '20030401 00:00:00.000', 6, '1b        ');

INSERT INTO Pass_in_trip
VALUES (1181, '20030401 00:00:00.000', 8, '3c        ');

INSERT INTO Pass_in_trip
VALUES (1181, '20030413 00:00:00.000', 5, '1b        ');

INSERT INTO Pass_in_trip
VALUES (1182, '20030413 00:00:00.000', 5, '4b        ');

INSERT INTO Pass_in_trip
VALUES (1187, '20030414 00:00:00.000', 8, '3a        ');

INSERT INTO Pass_in_trip
VALUES (1188, '20030401 00:00:00.000', 8, '3a        ');

INSERT INTO Pass_in_trip
VALUES (1182, '20030413 00:00:00.000', 9, '6d        ');

INSERT INTO Pass_in_trip
VALUES (1145, '20030425 00:00:00.000', 5, '1d        ');

INSERT INTO Pass_in_trip
VALUES (1187, '20030414 00:00:00.000', 10, '3d        ');

INSERT INTO Pass_in_trip
VALUES (8882, '20051106 00:00:00.000', 37, '1a        ');

INSERT INTO Pass_in_trip
VALUES (7771, '20051107 00:00:00.000', 37, '1c        ');

INSERT INTO Pass_in_trip
VALUES (7772, '20051107 00:00:00.000', 37, '1a        ');

INSERT INTO Pass_in_trip
VALUES (8881, '20051108 00:00:00.000', 37, '1d        ');

INSERT INTO Pass_in_trip
VALUES (7778, '20051105 00:00:00.000', 10, '2a        ');

INSERT INTO Pass_in_trip
VALUES (7772, '20051129 00:00:00.000', 10, '3a        ');

INSERT INTO Pass_in_trip
VALUES (7771, '20051104 00:00:00.000', 11, '4a        ');

INSERT INTO Pass_in_trip
VALUES (7771, '20051107 00:00:00.000', 11, '1b        ');

INSERT INTO Pass_in_trip
VALUES (7771, '20051109 00:00:00.000', 11, '5a        ');

INSERT INTO Pass_in_trip
VALUES (7772, '20051107 00:00:00.000', 12, '1d        ');

INSERT INTO Pass_in_trip
VALUES (7773, '20051107 00:00:00.000', 13, '2d        ');

INSERT INTO Pass_in_trip
VALUES (7772, '20051129 00:00:00.000', 13, '1b        ');

INSERT INTO Pass_in_trip
VALUES (8882, '20051113 00:00:00.000', 14, '3d        ');

INSERT INTO Pass_in_trip
VALUES (7771, '20051114 00:00:00.000', 14, '4d        ');

INSERT INTO Pass_in_trip
VALUES (7771, '20051116 00:00:00.000', 14, '5d        ');

INSERT INTO Pass_in_trip
VALUES (7772, '20051129 00:00:00.000', 14, '1c        ');
