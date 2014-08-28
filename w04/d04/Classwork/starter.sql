


CREATE TABLE birds (species varchar(50), wingspan integer, carnivore boolean);
CREATE TABLE trees (height integer, continent varchar(50));

INSERT INTO birds (species, wingspan, carnivore) VALUES ('Lola', 42, true)

SELECT * FROM birds;

SELECT * FROM birds WHERE carnivore = true;

SELECT * FROM birds WHERE species = 'Lola';

-- ids -- do this sequentially but don't reuse numbers when something is deleted

CREATE TABLE meerkats (id serial primary key, name varchar(50), age integer)
INSERT INTO meerkats (name, age) VALUES ('Bob', 68);

SELECT * FROM meerkats;

-- delete
DROP TABLE cars

