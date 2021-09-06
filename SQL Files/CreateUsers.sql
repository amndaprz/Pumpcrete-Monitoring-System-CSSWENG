
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
	username VARCHAR PRIMARY KEY,
	email VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	middle_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	role VARCHAR NOT NULL,
	password VARCHAR NOT NULL);
	