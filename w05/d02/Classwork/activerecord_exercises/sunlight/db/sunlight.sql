CREATE TABLE senators (
id serial primary key,
first varchar(100),
last varchar(100),
state varchar(100),
bioguide_id varchar(50),
birthday date,
party varchar(50)
);


CREATE TABLE bills (
id serial primary key,
senator_id integer,
short_title varchar(100),
pages integer,
enacted_as varchar(50),
introduced_on date
);




response["results"][0]["sponsor_id"]                                                                                          
response["results"][0]["sponsor"]["first_name"]
response["results"][0]["sponsor"]["last_name"]
response["results"][0]["short_title"]
response["results"][0]["last_version"]["pages"]
response["results"][0]["enacted_as"]
response["results"][0]["introduced_on"] 






response["results"][0]["bioguide_id"]
response["results"][0]["first_name"]
response["results"][0]["last_name"]
response["results"][0]["state"]
response["results"][0]["birthday"]
response["results"][0]["party"]