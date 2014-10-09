DROP TABLE books; 
DROP TABLE patrons; 

CREATE TABLE books(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(100), 
  patron_id INTEGER
);

CREATE TABLE patrons(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(100) 
); 