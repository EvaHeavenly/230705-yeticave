CREATE DATABASE yeticave
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE categories (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(64)
);

CREATE UNIQUE INDEX name ON categories(name);

INSERT INTO categories 
SET name = 'Доски и лыжи',
SET name = 'Крепления',
SET name = 'Ботинки',
SET name = 'Одежда',
SET name = 'Инструменты',
SET name = 'Разное';

CREATE TABLE lots (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(64),
 description VARCHAR(128),
 category_id INT, 
 image VARCHAR(128), 
 start_price INT, 
 finish_date DATETIME, 
 bet_step INT, 
 created_at DATETIME
);

CREATE INDEX l_name ON lots(name);

CREATE TABLE bets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  created_at DATETIME,
  bet_amount INT,
  author_id INT,
  lot_id INT
);

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
 reg_date DATETIME,
 email VARCHAR(64),
 name VARCHAR(64),
 password VARCHAR(64),
 avatar_url VARCHAR(128),
 contact VARCHAR(128)
);

CREATE UNIQUE INDEX email ON users(email); 
