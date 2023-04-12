INSERT INTO Customers (customer_id, first_name, last_name, email, phone, address, city, state, zip_code) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '123 Main St', 'Anytown', 'CA', '12345'),
(2, 'Jane', 'Doe', 'janedoe@example.com', '555-5678', '456 Oak St', 'Othertown', 'NY', '67890'),
(3, 'Bob', 'Smith', 'bobsmith@example.com', '555-9012', '789 Maple St', 'Another Town', 'FL', '34567'),
(4, 'Alice', 'Jones', 'alicejones@example.com', '555-3456', '321 Elm St', 'Yet Another Town', 'TX', '89012'),
(5, 'Charlie', 'Brown', '5@example.com', '555-7890', '654 Pine St', 'Final Town', 'WA', '23456'),
(6, 'Charlie6', 'Brown', '6@example.com', '555-7890', '654 Pine St', 'Final Town', 'WA', '23456'),
(7, 'Charlie7', 'Brown', '7@example.com', '555-7890', '654 Pine St', 'Final Town', 'WA', '23456'),
(8, 'Charlie8', 'Brown', '8@example.com', '555-7890', '654 Pine St', 'Final Town', 'WA', '23456'),
(9, 'Charlie9', 'Brown', '9@example.com', '555-7890', '654 Pine St', 'Final Town', 'WA', '23456'),
(10, 'Charlie10', 'Brown', '10@example.com', '555-7890', '654 Pine St', 'Final Town', 'WA', '23456');

INSERT INTO Products (product_id, name, description, price, image_url, category) VALUES
(1, 'Product 1', 'Description of product 1', 9.99, 'https://example.com/product1.jpg', 'Category A'),
(2, 'Product 2', 'Description of product 2', 19.99, 'https://example.com/product2.jpg', 'Category B'),
(3, 'Product 3', 'Description of product 3', 29.99, 'https://example.com/product3.jpg', 'Category C'),
(4, 'Product 4', 'Description of product 4', 39.99, 'https://example.com/product4.jpg', 'Category A'),
(5, 'Product 5', 'Description of product 5', 49.99, 'https://example.com/product5.jpg', 'Category B');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2023-03-30', 29.97),
(2, 2, '2023-04-01', 39.98),
(3, 3, '2023-04-02', 49.97),
(4, 4, '2023-04-03', 59.96),
(5, 5, '2023-04-04', 69.95);

INSERT INTO Order_Items (order_id, product_id, quantity, price_per_unit) VALUES
(1, 1, 1, 9.99),
(1, 4, 2, 14.99),
(2, 2, 2, 19.99),
(2, 4, 1, 19.99),
(2, 5, 1, 0),
(3, 1, 2, 9.99),
(3, 3, 1, 29.99),
(4, 1, 3, 9.99),
(4, 2, 2, 19.99),
(5, 3, 1, 29.99),
(5, 5, 2, 39.98);

INSERT INTO Employees (employee_id, first_name, last_name, email, phone, hire_date, job_title) VALUES
(1, 'Tom', 'Jones', 'tomjones@example.com', '555-1234', '2019-01-01', 'Manager');
