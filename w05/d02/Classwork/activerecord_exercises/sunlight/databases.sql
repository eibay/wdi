CREATE DATABASE senatorial_stats;
\c senatorial_stats;
CREATE TABLE senators(first varchar(255), last varchar(255), state varchar(4), bioguide_id varchar(255), party varchar(25), birthday date);
CREATE TABLE bills (short_title varchar(255), pages integer, enacted boolean, introduced_on date);
