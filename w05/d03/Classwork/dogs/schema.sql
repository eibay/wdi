CREATE TABLE breeds (
id serial primary key,
breed varchar(100),
url varchar(255)
);

Breed.create(name: "beagle", size: "small", talkative: true, age: 15) 