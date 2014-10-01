CREATE DATABASE people;

CREATE TABLE people (
id serial primary key,
name varchar(255),
age integer
);

INSERT INTO people (name, age) VALUES ('Brenda', 40);

-- FOR CONSOLE.RB
-- new_person = Person.create({name: "Joe", age: 50})  