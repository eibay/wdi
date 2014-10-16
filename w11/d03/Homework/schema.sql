DROP TABLE users;
DROP TABLE accounts; 

CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  email VARCHAR(100),
  password_digest VARCHAR(100)
);

CREATE TABLE accounts(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,  
  amount DECIMAL(10, 2)
); 