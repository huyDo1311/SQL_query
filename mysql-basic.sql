-- Tạo database
CREATE DATABASE demo_database;  -- Thêm dấu chấm phẩy ở đây

-- Tạo database nếu chưa tồn tại
CREATE DATABASE IF NOT EXISTS demo_database;

-- Sử dụng database
USE demo_database;

-- TABLE
CREATE TABLE IF NOT EXISTS users (	
	users_id INT, 
	full_name VARCHAR(255), 
	email VARCHAR(255), 
	age INT, 
	birth_day DATE,
	money DOUBLE, 
	is_active BOOLEAN
);

-- Đổi tên table
RENAME TABLE users TO users_rename;

-- Xoá Table
DROP TABLE users_rename;
DROP TABLE IF EXISTS users_rename;

-- RÀNG BUỘC

-- Not null
CREATE TABLE not_null (
	id INT NOT NULL,
	age INT
);

-- Unique
CREATE TABLE `unique` (
	id INT UNIQUE
);

-- Default
CREATE TABLE `default` (
	id INT NOT NULL UNIQUE,
	role VARCHAR(255) DEFAULT 'ROLE_USER',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);              

-- khoá chính: PRIMARY KEY
CREATE TABLE primary_key (
	id BIGINT PRIMARY KEY AUTO_INCREMENT
);

-- khoá phụ: FOREIGN KEY
CREATE TABLE foreign_key (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	foreign_key BIGINT,
	FOREIGN KEY (foreign_key) REFERENCES primary_key(id)
);

-- THÊM DỮ LIỆU VÀO TABLE
INSERT INTO users (users_id, full_name, email, age, birth_day, money, is_active) 
VALUES
(1, 'long 1', 'long@gmail.com', 18, '1999-01-01', 1500000, TRUE),
(2, 'long 2', 'long2@gmail.com', 19, '1999-01-02', 1600000, FALSE),
(3, 'long 4', 'long4@gmail.com', 20, '1999-01-03', 1700000, TRUE);

-- UPDATE DỮ LIỆU
UPDATE users 
SET money = 99999999
WHERE users.users_id = 1


-- XOÁ DỮ LIỆU 
DELETE FROM users
WHERE users_id = 2

-- TRUY VẤN
SELECT * FROM users

CREATE DATABASE db_app_food

CREATE TABLE users(
	users_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

INSERT INTO users(full_name, email, pass_word) VALUES 
('Nguyễn Văn A', 'a@example.com', 'password123'),
('Trần Thị B', 'b@example.com', 'password123'),
('Lê Quang C', 'c@example.com', 'password123'),
('Phan Minh D', 'd@example.com', 'password123'),
('Hoàng Thu E', 'e@example.com', 'password123'),
('Đoàn Linh F', 'f@example.com', 'password123'),
('Vũ Thi G', 'g@example.com', 'password123'),
('Bùi Quốc H', 'h@example.com', 'password123'),
('Ngô Tấn I', 'i@example.com', 'password123'),
('Dương Hồng J', 'j@example.com', 'password123');

SELECT * FROM users

SELECT full_name AS 'Họ và tên', email FROM users

SELECT * FROM users
LIMIT 2 OFFSET 1

CREATE TABLE foods (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	description VARCHAR(255)
)

INSERT INTO foods (food_name, description) VALUES
('Pho', 'A traditional Vietnamese noodle soup consisting of broth, rice noodles, herbs, and meat, usually beef or chicken'),
('Bánh mì', 'A Vietnamese sandwich made with a French baguette filled with various meats, vegetables, and condiments'),
('Bánh xèo', 'A Vietnamese savory pancake made of rice flour, water, and turmeric powder, stuffed with pork, shrimp, and bean sprouts'),
('Gỏi cuốn', 'Vietnamese spring rolls made of rice paper, filled with shrimp, pork, vegetables, and rice noodles, often served with peanut sauce'),
('Chả giò', 'Vietnamese fried spring rolls, usually filled with ground pork, shrimp, and vegetables'),
('Cơm tấm', 'Vietnamese broken rice served with grilled pork, but often served with a variety of different meats'),
('Bánh bao', 'A Vietnamese steamed bun filled with pork, eggs, and sometimes mushrooms or vegetables'),
('Hủ tiếu', 'A noodle soup made with pork, shrimp, and noodles, often served in a clear broth'),
('Bánh canh', 'A Vietnamese thick noodle soup with fish or pork, served in a rich broth'),
('Mì Quảng', 'A Vietnamese noodle dish originating from Quảng Nam Province, made with rice noodles, meat, and a small amount of broth');





CREATE TABLE orders (
    orders_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    food_id INT,
    FOREIGN KEY (user_id) REFERENCES users(users_id),
    FOREIGN KEY (food_id) REFERENCES foods(food_id)
);

INSERT INTO orders (user_id, food_id) VALUES
(1,2),
(3,1),
(2,5),
(1,3),
(3,1)

SELECT * FROM orders


SELECT orders.orders_id, users.full_name
FROM orders
INNER JOIN users ON orders.user_id = users.users_id;


SELECT * 
FROM users
LEFT JOIN orders ON orders.user_id = users.users_id

SELECT * 
FROM users
RIGHT JOIN orders ON orders.user_id = users.users_id

SELECT * 
FROM orders
CROSS JOIN users 


SELECT 
    users.users_id,
    users.email,
    users.full_name, 
    COUNT(users.users_id) AS order_count
FROM orders
INNER JOIN users ON orders.user_id = users.users_id
GROUP BY users.users_id

SELECT 
    users.users_id,
    users.email,
    users.full_name, 
    COUNT(users.users_id) AS order_count
FROM orders
INNER JOIN users ON orders.user_id = users.users_id
GROUP BY users.users_id
ORDER BY order_count asc



SELECT 
    COUNT(orders.user_id) AS 'Like',  -- Counting the number of orders (likes)
    orders.user_id,  -- User ID from orders table
    users.users_id, 
    users.full_name, 
    users.email,
    users.pass_word
FROM orders
INNER JOIN users ON orders.user_id = users.users_id
GROUP BY orders.user_id
ORDER BY `Like` DESC
LIMIT 5;


SELECT 
    COUNT(orders.food_id) AS 'Like',  -- Counting the number of orders (likes)
    orders.food_id,  -- User ID from orders table
    foods.food_id, 
    foods.food_name
FROM orders
INNER JOIN foods ON orders.food_id = foods.food_id
GROUP BY orders.food_id
ORDER BY `Like` DESC  -- Order by count of 'Like' in descending order
LIMIT 2; 


SELECT *
FROM users
LEFT JOIN orders ON users.users_id = orders.user_id
WHERE orders.user_id IS NULL





