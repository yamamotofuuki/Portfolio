set client_encoding TO 'UTF8';

CREATE TABLE webaccount (
id SERIAL PRIMARY KEY,
password VARCHAR(255),
user_name VARCHAR(100),
insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
