SELECT *, REGEXP_REPLACE(name, '[ ]+', ' ')
  FROM ships;

UPDATE Ships
   SET name = REPLACE(REPLACE(REPLACE(name, '  ', ' '), '  ', ' '), '  ', ' ');

UPDATE Ships
   SET name = (SELECT STRING_AGG(value, ' ')
                 FROM string_split(Ships.name, ' ')
                WHERE value <> '');

UPDATE Ships
   SET name = REPLACE(REPLACE(REPLACE(name, ' ', ' <>'), '> ', ''), '<>', ' ');

UPDATE Ships
   SET name = REPLACE(REPLACE(REPLACE(name, '  ', ' *'), '* ', ''), '*', '');
