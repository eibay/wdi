CREATE TABLE t_shirts (
  id SERIAL PRIMARY KEY,
  available_quanity INTEGER, 
  price DECIMAL(7,2), -- max price 99999.99, we're a family company 
  img_src VARCHAR(225)
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY, 
  email VARCHAR(225),
  tshirt_id INTEGER,
  tshirt_quanity INTEGER, 
  total DECIMAL(9,2) -- no orders over 9999999.99, see above 
);