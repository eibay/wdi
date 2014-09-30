DROP TABLE items; 

CREATE TABLE items(
  id SERIAL PRIMARY KEY,
  item VARCHAR(100),
  quanity INTEGER
);