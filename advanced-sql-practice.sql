drop table if exists orders;
drop table if exists customers;


create table customers (
 id int primary key auto_increment,
 first_name varchar(50),
 last_name varchar(50)
);

create table orders (
 id int primary key,
 customer_id int null,
 order_date date,
 total_amount decimal(10, 2),
 foreign key (customer_id) references customers(id)
);

insert into customers (id, first_name, last_name) values
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Smith'),
(4, 'Bob', 'Brown');

insert into orders (id, customer_id, order_date, total_amount) values
(1, 1,'2023-01-01', 100.00),
(2, 1,'2023-02-01', 150.00),
(3, 2, '2023-01-01', 200.00),
(4, 3, '2023-04-01', 250.00),
(5, 3, '2023-04-01', 300.00),
(6, NULL, '2023-04-01', 100.00);


SELECT * FROM customers;
SELECT * FROM orders;


#JOIN Query - shows all orders with the relative customers first and last name

SELECT orders.id, customers.first_name, customers.last_name
FROM orders
INNER JOIN customers ON orders.customer_id=customers.id;

# LEFT JOIN - includes all rows from first table (orders) even without a matching ID, so it includes index 6 which is null
SELECT orders.id, customers.first_name, customers.last_name, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id=customers.id;


# GROUP BY - clause you can use in SELECT statements to group rows with the same values into summary rows

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

# this gets the sum total of each customer

# Counts the number of orders made by each customer
SELECT customer_id, COUNT(customer_id) AS total_orders
FROM orders
GROUP BY customer_id;

# WHERE and HAVING

# WHERE total is less than 200
SELECT customer_id
FROM orders
WHERE total_amount < 200
GROUP BY customer_id;

#HAVING - same as previous example
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING total_amount < 200









