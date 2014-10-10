DROP TABLE clients; 
DROP TABLE photos;
DROP TABLE albums; 
DROP TABLE categories; 

CREATE TABLE clients(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(100), 
  email VARCHAR(100), 
  phone VARCHAR(20) 
);

CREATE TABLE photos(
  id SERIAL PRIMARY KEY,
  album_id INTEGER, 
  taken_on TIMESTAMP, 
  caption TEXT, 
  photo BYTEA 
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY, 
  title VARCHAR(200), 
  taken_on DATE, 
  client_id INTEGER, 
  category_id INTEGER 
);

CREATE TABLE categories(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(150) 
); 