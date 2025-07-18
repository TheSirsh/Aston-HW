/* Систаксис SQLLite */

/* Создание таблицы Products. */
CREATE TABLE Products(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	product_name VARCHAR(15),
	category VARCHAR(15),
	price DECIMAL(7, 2)
);

/* Добавление данных в таблицу Products. */
INSERT INTO Products(product_name, category, price)
VALUES ('Laptop', 'Electronics', 1000.00),
	('Smartphone', 'Electronics', 500.00),
	('Table', 'Furniture', 150.00),
	('Chair', 'Furniture', 75.00);

/* Создание таблицы Orders. */
CREATE TABLE Orders(
	id INT NOT NULL PRIMARY KEY,
	product_id INT,
	quantity int,
	order_date DATE,
	FOREIGN KEY (product_id) REFERENCES Products (id)
);

/* Добавление данных в таблицу Orders. */
INSERT INTO Orders(product_id, quantity, order_date)
VALUES (1, 2, '2023-01-15'),
	(2, 1, '2023-02-20'),
	(3, 4, '2023-03-05'),
	(4, 3, '2023-04-10'),
	(1, 1, '2023-05-22');

/* Вывод списка всех товаров вместе с количеством заказов каждого товара. */
SELECT product_name AS "Название товара",
	SUM(Orders.quantity) AS "Количество заказов"
FROM Products
	JOIN Orders ON Orders.product_id = Products.id
GROUP BY Products.product_name;

/* Вывод общей суммы продаж (в долларах) для каждого товара. */
SELECT product_name AS "Название продукта",
	SUM(orders.quantity * Products.price) || '$' AS "Общая стоимость"
FROM Products
	JOIN orders ON orders.product_id = products.id
GROUP BY Products.product_name_id = Orders.product_id
GROUP BY Products.product_name;

/* Вывод списка всех заказов, сделанных в марте 2023 года, включая название товара и количество. */
SELECT Orders.order_date AS "Дата заказа",
	Products.product_name AS "Название продукта",
	Orders.quantity AS "Количество проданного товара"
FROM Products
	JOIN Orders ON Orders.product_id = Products.id
WHERE Orders.order_date BETWEEN '2023-03-01' AND '2023-03-31';