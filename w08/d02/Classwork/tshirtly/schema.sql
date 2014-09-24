CREATE TABLE tshirts(
id serial primary key,
name varchar(50),
price integer,
quantity integer,
image varchar(200)
)

CREATE TABLE users(
id serial primary key,
email varchar(200),
quantity integer,
tshirt_id integer
)

