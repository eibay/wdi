CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  email VARCHAR(150),
  password VARCHAR(150)
);

CREATE TABLE accounts(
  id SERIAL PRIMARY KEY, 
  balance integer,
  user_id integer  
);

