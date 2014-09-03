CREATE TABLE bills (
id serial primary key,
short_title varchar(255),
pages integer,
enacted boolean,
introduced date, 
sponsor varchar(50)
);
