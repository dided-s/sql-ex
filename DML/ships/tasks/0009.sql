UPDATE battles
   SET name = CONCAT(REPLACE(name, RTRIM(name), ''), RTRIM(name));
