CREATE TABLE Products( /* Создание таблицы Products */
	product_id INT NOT NULL PRIMARY KEY, /* Функция автоинкремента по-разному поддерживается в разных СУБД, поэтому без неё */
	product_name VARCHAR(15),
	category VARCHAR(15),
	price DECIMAL(7, 2)
);

INSERT INTO Products(product_id, product_name, category, price)
VALUES (1, 'Laptop', 'Electronics', 1000.00),
	(2, 'Smartphone', 'Electronics', 500.00),
	(3, 'Table', 'Furniture', 150.00),
	(4, 'Chair', 'Furniture', 75.00);

CREATE TABLE Orders( /* Создание таблицы Orders */
	order_id INT NOT NULL PRIMARY KEY, /* Функция автоинкремента по-разному поддерживается в разных СУБД, поэтому без неё */
	product_id INT,
	quantity int,
	order_date DATE
);

INSERT INTO Orders(order_id, product_id, quantity, order_date)
VALUES (1, 1, 2, '2023-01-15'),
	(2, 2, 1, '2023-02-20'),
	(3, 3, 4, '2023-03-05'),
	(4, 4, 3, '2023-04-10'),
	(5, 1, 1, '2023-05-22');

SELECT Products.product_name AS 'Наименование_продукта', 
	COUNT(Orders.product_id) AS 'Количество_заказов',
	SUM(price * Orders.quantity) AS 'Общая_сумма_продаж'
FROM Products
	JOIN Orders ON Products.product_id = Orders.product_id
GROUP BY Products.product_name;

SELECT Orders.order_date AS Дата_заказа,
  Products.product_name AS Название_продукта,
  Orders.quantity AS Количество_проданного_товара
FROM Products
	JOIN Orders ON Orders.product_id = Products.product_id
WHERE Orders.order_date LIKE '2023_03%'; /* Можно использовать регулярное выражения вида '^2023.03', но, как и в случае с инкрементом в разных СУБД разный синтаксис */