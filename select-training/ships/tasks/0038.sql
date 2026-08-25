SELECT country
  FROM classes
 WHERE type = 'bc'

INTERSECT

SELECT country
  FROM classes
 WHERE type = 'bb';
