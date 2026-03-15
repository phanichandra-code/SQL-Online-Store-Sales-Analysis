CREATE DATABASE IF NOT EXISTS OnlineStore;
USE OnlineStore;

CREATE TABLE IF NOT EXISTS Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
city VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price INT
);

CREATE TABLE IF NOT EXISTS Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS Order_Details (
order_id INT,
product_id INT,
quantity INT,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers VALUES
(1,'Ravi','Hyderabad'),
(2,'Asha','Delhi'),
(3,'Rahul','Mumbai'),
(4,'Priya','Chennai');
INSERT INTO Products VALUES
(101,'Laptop',50000),
(102,'Mobile',20000),
(103,'Headphones',2000),
(104,'Keyboard',1500);
INSERT INTO Orders VALUES
(1,1,'2024-01-01'),
(2,2,'2024-01-02'),
(3,3,'2024-01-03');
INSERT INTO Order_Details VALUES
(1,101,1),
(1,103,2),
(2,102,1),
(3,104,3);
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT c.name, o.order_id, o.order_date
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;
SELECT product_id, SUM(quantity) AS total_sales
FROM Order_Details
GROUP BY product_id;
SELECT product_id, SUM(quantity) AS sales
FROM Order_Details
GROUP BY product_id
ORDER BY sales DESC
LIMIT 1;
SELECT 
c.customer_id,
c.name AS customer_name,
c.city,
o.order_id,
o.order_date,
p.product_name,
p.price,
od.quantity,
(p.price * od.quantity) AS total_price
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;
