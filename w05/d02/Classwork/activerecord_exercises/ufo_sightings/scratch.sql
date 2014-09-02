require 'pry'
require 'json'

# ufos = []

# ufo = {
# 	sighted_at: "20100603"
# 	reported_at: "20100706"
# 	location: " Bluffton, IN"
# 	shape: " circle"
# 	duration: "15 min."
# 	description: "blah blah"
# }



CREATE DATABASE ufos;

CREATE TABLE sightings(
  sighted_at date,
  reported_at date,
  location varchar(50),
  shape varchar(50),
  duration varchar(50),
  description text,
  id serial primary key
);


-----------------------

-- To add an entry
INSERT INTO monkeys (name, age) VALUES ('Brutus', 13);
INSERT INTO monkeys (name, age) VALUES ('Cletus', 4);

-- Return all entries on a table
SELECT * FROM monkeys;

-- Return entries based on a specified attribute
SELECT * FROM birds WHERE name = 'Lola';

-- Add a serialized ID to the table
CREATE TABLE mechanic (id serial primary key, name varchar(50));

-- Let Postgres assign the ID, you don't have to worry about it!
INSERT INTO mechanic (name) VALUES ('Fred');




