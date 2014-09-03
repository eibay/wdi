-- To enter Postgres Terminal
psql

-- To quit psql
\q

-- To create database
CREATE DATABASE wdumblr;

-- To connect to a database
\c;

-- To create a table in my database
CREATE TABLE authors (id serial primary key, name varchar(50), email varchar(50));

-- To add an entry
INSERT INTO authors (name, email) VALUES ('Jon Krakauer', 'jkrakauer@gmail.com');
INSERT INTO authors (name, email) VALUES ('Tom Wolfe', 'twolfe@gmail.com');

-- Return all entries on a table
SELECT * FROM authors;



-- To create a table in my database
CREATE TABLE posts (id serial primary key, content varchar(300), created_at timestamp, keywork varchar(20), author_id integer );

-- To add an entry--dont do this
INSERT INTO posts (content, created_at, keyword, author_id) VALUES ('I now walk into the wild.', now, 'alaska', 1);


-- Return entries based on a specified attribute
SELECT * FROM birds WHERE name = 'Lola';

-- Add a serialized ID to the table
CREATE TABLE mechanic (id serial primary key, name varchar(50));

-- Let Postgres assign the ID, you don't have to worry about it!
INSERT INTO mechanic (name) VALUES ('Fred');

-- delete
DROP TABLE cars

Show the structure of the table by typing \d NAME
