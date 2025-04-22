INSERT INTO customers (name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com');

INSERT INTO products (name, price, stock) VALUES
('Laptop', 1200.00, 10),
('Mouse', 25.00, 100),
('Keyboard', 45.00, 50);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-04-20'),
(2, '2025-04-21');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  -- Alice buys 1 Laptop
(1, 2, 2),  -- Alice buys 2 Mice
(2, 3, 1);  -- Bob buys 1 Keyboard
