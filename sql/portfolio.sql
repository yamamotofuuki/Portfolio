set names utf8;
set foreign_key_checks = 0;

drop database if exists portfolio;
create database if not exists portfolio;

use portfolio;

drop table if exists webaccount;

create table webaccount(
id int not null primary key auto_increment,
password varchar(255),
user_name varchar(100),
insert_date datetime,
updated_date datetime
);

create table favorites (
id int not null primary key auto_increment,
user_id int,
item_id int,
insert_date datetime,
FOREIGN KEY (user_id) REFERENCES webaccount(id)
);
