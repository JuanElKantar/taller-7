create database myapp;
use myapp;
create table users_tbl(
user_id int primary key auto_increment,
user_firstname VARCHAR(40),
user_lastname VARCHAR(40),
user_email VARCHAR(60),
user_password VARBINARY(256)
);
create table category_tbl(
category_id int primary key auto_increment,
category_name VARCHAR(40)
);
create table product_tbl(
product_id int primary key auto_increment,
product_name VARCHAR(40),
product_value decimal,
category_id int
);
Alter table product_tbl 
ADD CONSTRAINT FKproduCate FOREIGN KEY (category_id) references category_tbl (category_id);

INSERT INTO myapp.users_tbl (user_firstname, user_lastname, user_email, user_password)
VALUES (UPPER('nombres'), UPPER('apellidos'), 'jjk@email.com',AES_ENCRYPT
('password', '$2a$12$ddqbWgqCoTtTSrc.QXz97OBVXQswzDwrGLbnEE/aa0JD8s58JnJSi'));
INSERT INTO myapp.users_tbl (user_firstname, user_lastname, user_email, user_password)
VALUES (UPPER('Juan'), UPPER('Abreu'), 'jjkj@gmail.com',AES_ENCRYPT
('3169648Aa', '$2a$12$ddqbWgqCoTtTSrc.QXz97OBVXQswzDwrGLbnEE/aa0JD8s58JnJSi'));


SELECT *, CAST(AES_DECRYPT(user_password, '$2a$12$ddqbWgqCoTtTSrc.QXz97OBVXQswzDwrGLbnEE/aa0JD8s58JnJSi')
AS CHAR(50)) end_data FROM users_tbl WHERE user_id = 2;

                                                  