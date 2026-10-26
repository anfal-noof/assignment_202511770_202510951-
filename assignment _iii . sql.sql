CREATE DATABASE lana_202511770_pharmacy_system;
-- 1. CREATE TABLES

CREATE TABLE medicines (
    medicine_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    medicine_name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);

CREATE TABLE customers (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE sales (
    sale_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    medicine_id INT REFERENCES medicines(medicine_id),
    quantity INT
);


-- 2. INSERT INITIAL DATA
-- Five records in each table

INSERT INTO medicines (medicine_name, price, quantity)
VALUES
('Paracetamol', 1000, 50),
('Amoxicillin', 2500, 20),
('Vitamin C', 1500, 15),
('Ibuprofen', 2000, 40),
('Cough Syrup', 3000, 25);

INSERT INTO customers (customer_name, phone)
VALUES
('Amina', '0781000001'),
('Sara', '0781000002'),
('Mary', '0781000003'),
('John', '0781000004'),
('David', '0781000005');

INSERT INTO sales (customer_id, medicine_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(1, 5, 1);


-- 3. SELECT TASKS

-- Q1.1: Basic Data Retrieval
SELECT medicine_name, price
FROM medicines;

-- Q1.2: Conditional Data Retrieval
SELECT *
FROM medicines
WHERE price > 1500;

-- Q1.3: Sorted Data Retrieval
SELECT *
FROM medicines
ORDER BY price ASC;


-- 4. JOIN TASKS

-- Q2.1: INNER JOIN
SELECT customers.customer_name, sales.quantity
FROM customers
INNER JOIN sales
ON customers.customer_id = sales.customer_id;

-- Q2.2: LEFT JOIN
SELECT customers.customer_name, sales.sale_id
FROM customers
LEFT JOIN sales
ON customers.customer_id = sales.customer_id;

-- Q2.3: Multi-Table JOIN
SELECT customers.customer_name,
       medicines.medicine_name,
       sales.quantity
FROM sales
INNER JOIN customers
ON sales.customer_id = customers.customer_id
INNER JOIN medicines
ON sales.medicine_id = medicines.medicine_id;


-- 5. UPDATE TASKS

-- Q3.1: Update One Record
UPDATE medicines
SET price = 1200
WHERE medicine_name = 'Paracetamol';

SELECT * FROM medicines
WHERE medicine_name = 'Paracetamol';

-- Q3.2: Update Multiple Records
UPDATE medicines
SET quantity = quantity + 10
WHERE quantity < 30;

SELECT * FROM medicines;

-- Q3.3: Conditional Update
UPDATE medicines
SET price = price + 100
WHERE quantity < 20;

SELECT * FROM medicines
WHERE quantity < 20;


-- 6. ALTER TABLE TASKS

-- Q4.1: Rename a Column
ALTER TABLE customers
RENAME COLUMN customer_name TO full_name;

SELECT * FROM customers;

-- Q4.2: Change a Column Data Type
ALTER TABLE medicines
ALTER COLUMN price TYPE NUMERIC(12,2);

SELECT * FROM medicines;

-- Q4.3: Add a New Column
ALTER TABLE medicines
ADD COLUMN expiry_date DATE;

SELECT * FROM medicines;


-- 7. ADDITIONAL INSERT TASKS

-- Q5.1: Insert a Single Record
INSERT INTO medicines
(medicine_name, price, quantity, expiry_date)
VALUES
('Aspirin', 1800, 30, '2027-12-31');

SELECT * FROM medicines
WHERE medicine_name = 'Aspirin';

-- Q5.2: Insert Multiple Records
INSERT INTO customers (full_name, phone)
VALUES
('Peter', '0781000006'),
('Grace', '0781000007');

SELECT * FROM customers;

-- Q5.3: Insert a Related Record
INSERT INTO sales (customer_id, medicine_id, quantity)
VALUES (5, 1, 2);

SELECT * FROM sales
WHERE customer_id = 5;


-- 8. VERIFY INITIAL RECORDS

SELECT * FROM medicines;
SELECT * FROM customers;
SELECT * FROM sales;

-- Insert five medicine records

INSERT INTO medicines (medicine_name, price, quantity)
VALUES
('Paracetamol', 1000, 50),
('Amoxicillin', 2500, 20),
('Vitamin C', 1500, 15),
('Ibuprofen', 2000, 40),

INSERT INTO customers (customer_name, phone)
VALUES
('Amina', '0781000001'),
('Sara', '0781000002'),
('Mary', '0781000003'),
('John', '0781000004'),
('David', '0781000005');


INSERT INTO sales (customer_id, medicine_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(1, 5, 1);

-- Q1.1: Display medicine names and prices

SELECT medicine_name, price
FROM medicines;

-- Q1.3: Sort medicines by price in ascending order

SELECT *
FROM medicines
ORDER BY price ASC;

-- Q2.1: INNER JOIN

SELECT customers.customer_name, sales.quantity
FROM customers
INNER JOIN sales
ON customers.customer_id = sales.customer_id;

-- Q2.2: LEFT JOIN

SELECT customers.customer_name, sales.sale_id
FROM customers
LEFT JOIN sales
ON customers.customer_id = sales.customer_id;

-- Q2.3: Multi-Table JOIN

SELECT customers.customer_name,
       medicines.medicine_name,
       sales.quantity
FROM sales
INNER JOIN customers
ON sales.customer_id = customers.customer_id
INNER JOIN medicines
ON sales.medicine_id = medicines.medicine_id;

-- Q3.1: Update One Record
UPDATE medicines
SET price = 1200
WHERE medicine_name = 'Paracetamol';

SELECT * FROM medicines
WHERE medicine_name = 'Paracetamol';

-- Q3.2: Update Multiple Records
UPDATE medicines
SET quantity = quantity + 10
WHERE quantity < 30;

SELECT * FROM medicines;

-- Q3.3: Conditional Update
UPDATE medicines
SET price = price + 100
WHERE quantity < 20;

SELECT * FROM medicines
WHERE quantity < 20;

-- Q4.1: Rename Column
ALTER TABLE customers
RENAME COLUMN customer_name TO full_name;

SELECT * FROM customers;

-- Q4.2: Change Data Type
ALTER TABLE medicines
ALTER COLUMN price TYPE NUMERIC(12,2);

SELECT * FROM medicines;

-- Q4.3: Add New Column
ALTER TABLE medicines
ADD COLUMN expiry_date DATE;

SELECT * FROM medicines;


-- Q5.1: Insert One Medicine
INSERT INTO medicines (medicine_name, price, quantity, expiry_date)
VALUES ('Aspirin', 1800, 30, '2027-12-31');

SELECT * FROM medicines
WHERE medicine_name = 'Aspirin';

-- Q5.2: Insert Two Customers
INSERT INTO customers (full_name, phone)
VALUES
('Peter', '0781000006'),
('Grace', '0781000007');

SELECT * FROM customers;

-- Q5.3: Insert Related Sale
INSERT INTO sales (customer_id, medicine_id, quantity)
VALUES (5, 1, 2);

SELECT * FROM sales
WHERE customer_id = 5;

SELECT medicine_name, price
FROM medicines;



































































































































































