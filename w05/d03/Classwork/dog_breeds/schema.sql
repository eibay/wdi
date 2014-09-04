CREATE TABLE breeds(
breed varchar(50),
id serial primary key,
img_url varchar(200)
);

CREATE TABLE dogs(
breed varchar(50)
id serial primary key,
img_url varchar(200)
);