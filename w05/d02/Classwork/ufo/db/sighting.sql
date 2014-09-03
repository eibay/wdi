CREATE TABLE sightings
#be smart about naming
# s and class is sighting
 (
id serial primary key,
sighted_at date,
#date in conjuction with activerecord
#does crazy magic
#
reported_at date,
shape varchar(100),
duration varchar(100),
location varchar(100),
description text
);

#copy and paste in psql so easier to do