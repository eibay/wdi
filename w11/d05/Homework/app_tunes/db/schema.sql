DROP TABLE songs;
DROP TABLE artists; 
DROP TABLE albums; 

CREATE TABLE songs(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(200), 
  album_id INTEGER  
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(250),
  year INTEGER,
  artist_id INTEGER  
);


CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(175), 
  genre VARCHAR(250),
  number_of_albums INTEGER
);