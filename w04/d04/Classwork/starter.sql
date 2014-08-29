


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


-- HOMEWORK

CREATE DATABASE tablefun;

CREATE TABLE schools (id serial primary key, name varchar(50), city varchar(50), state varchar(30), zip varchar(5));


INSERT INTO schools (name, city, state, zip) VALUES ('South Side HS', 'Rockville Centre', 'New York', '11570');
INSERT INTO schools (name, city, state, zip) VALUES ('Oceanside HS', 'Oceanside', 'New York', '11480');
INSERT INTO schools (name, city, state, zip) VALUES ('University of Arizona', 'Tucson', 'Arizona', '14383');

SELECT * FROM schools;

UPDATE schools
SET Column1 = REPLACE(Manhattan High)
WHERE Column1 LIKE '%a%'

CREATE TABLE teachers (id serial primary key, name varchar(50), email varchar(40), subject varchar(50), age integer);

INSERT INTO teachers (name, email, subject, age) VALUES ('Ms. Jane Smith', 'jsmith@oceansidehs.com', 'Math', 30);
INSERT INTO teachers (name, email, subject, age) VALUES ('Mr. Seymour Brown', 'sbrown@southsidehs.com', 'Math', 35);

INSERT INTO teachers (name, email, subject, age) VALUES ('Mr. John Miluf', 'jmiluf@uofarizona.com', 'Painting', 38);
INSERT INTO teachers (name, email, subject, age) VALUES ('Mr. Sam Williamson', 'swilliamson@oceansidehs.com', 'Physics', 23);
INSERT INTO teachers (name, email, subject, age) VALUES ('Ms. Jill Nelson', 'jnelson@oceansidehs.com', 'Gym', 40);
INSERT INTO teachers (name, email, subject, age) VALUES ('Ms. Amy Smith', 'asmith@uorarizona.com', 'Anthropology', 51);

SELECT * FROM teachers;
SELECT * FROM schools;

UPDATE teachers
SET Column5 = REPLACE(Column5,40)
-- WHERE Column1 LIKE '%a%'

UPDATE schools SET name='Manhattan High';

UPDATE teachers SET age=40 WHERE subject='Math';

DELETE FROM teachers WHERE subject='math';


