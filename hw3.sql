CREATE DATABASE IF NOT EXISTS hw3;

USE hw3;

CREATE TABLE IF NOT EXISTS salespeople (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    snum INT NOT NULL,
    sname VARCHAR(25) NOT NULL,
    city VARCHAR(25),
    comm DECIMAL(3,2)
);

CREATE TABLE IF NOT EXISTS customers (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cnum INT NOT NULL,
    cname VARCHAR(25) NOT NULL,
    city VARCHAR(25),
    rating INT,
    snum INT
);

CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    onum INT NOT NULL,
    amt DECIMAL(6,2),
    odate DATE,
    cnum INT NOT NULL,
    snum INT NOT NULL
);

INSERT INTO salespeople (snum, sname, city, comm) VALUES
	(1001, "Peel", "London", 0.12),
	(1002, "Serres", "San Jose", 0.13),
	(1004, "Motika", "London", 0.11),
	(1007, "Rifkin", "Barcelona", 0.15),
	(1003, "Axelrod", "New York", 0.10);
    
INSERT INTO customers(cnum, cname, city, rating, snum) VALUES
	(2001, "Hoffman", "London", 100, 1001),
	(2002, "Giovanni", "Rome", 200, 1003),
	(2003, "Liu", "SanJose", 200, 1002),
	(2004, "Grass", "Berlin", 300, 1002),
	(2006, "Clemens", "London", 100, 1001),
	(2008, "Cisneros", "SanJose", 300, 1007),
	(2007, "Pereira", "Rome", 100, 1004);

INSERT INTO orders(onum, amt, odate, cnum, snum) VALUES
	(3001, 18.69, '1990-03-10', 2008, 1007),
	(3003, 767.19, '1990-03-10', 2001, 1001),
	(3002, 1900.10, '1990-03-10', 2007, 1004),
	(3005, 5160.45, '1990-03-10', 2003, 1002),
	(3006, 1098.16, '1990-03-10', 2008, 1007),
	(3009, 1713.23, '1990-04-10', 2002, 1003),
	(3007, 75.75, '1990-04-10', 2004, 1002),
	(3008, 4723.00, '1990-05-10', 2006, 1001),
	(3010, 1309.95, '1990-06-10', 2004, 1002),
	(3011, 9891.88, '1990-06-10', 2006, 1001);
    
/* 1 */
SELECT city, sname, snum, comm FROM salespeople;

/* 2 */
SELECT rating, cname FROM customers
WHERE city = 'SanJose';

/* 3 */
SELECT DISTINCT snum FROM orders;

/* 4 */
SELECT cname FROM customers
WHERE cname LIKE 'G%';

/* 5 */
SELECT * FROM orders
WHERE amt > 1000;

/* 6 */
SELECT MIN(amt) AS minimalochka FROM orders;

/* 7 */
SELECT * FROM customers
WHERE city != 'Rome' AND rating > 100;
