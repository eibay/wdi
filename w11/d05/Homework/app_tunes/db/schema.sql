DROP TABLE songs;
DROP TABLE artists; 

CREATE TABLE songs(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(200), 
  artist_id INTEGER 
);

CREATE TABLE artists(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(175), 
  genre VARCHAR(250),
  number_of_albums INTEGER
);