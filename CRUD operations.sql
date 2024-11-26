-- 1.	CUSTOMER
-- Create (Insert)
INSERT INTO CUSTOMER (Patient_ID, Name, Address, Contact_No) VALUES 
(1, 'John Doe', '123 Elm Street', '1234567890'),
(2, 'Jane Smith', '456 Oak Avenue', '0987654321'),
(3, 'Alice Johnson', '789 Pine Road', '1122334455'),
(4, 'Bob Brown', '321 Maple Lane', '2233445566'),
(5, 'Emily Davis', '654 Cedar Drive', '3344556677');

-- Read (Select)
SELECT * FROM CUSTOMER;

-- Update
UPDATE CUSTOMER 
SET Address = '555 Birch Blvd' 
WHERE Patient_ID = 3;

-- Delete
DELETE FROM CUSTOMER WHERE Patient_ID = 5;
-- 2.	DRUG_MANUFACTURER
-- Create (Insert)
INSERT INTO DRUG_MANUFACTURER (Company_ID, Name) VALUES 
(1, 'PharmaCorp'),
(2, 'MediLife'),
(3, 'Wellness Inc'),
(4, 'BioHealth'),
(5, 'CareMeds');

-- Read (Select)
SELECT * FROM DRUG_MANUFACTURER;

-- Update
UPDATE DRUG_MANUFACTURER 
SET Name = 'Global Pharma' 
WHERE Company_ID = 2;

-- Delete
DELETE FROM DRUG_MANUFACTURER WHERE Company_ID = 5;

-- 3. DOCTOR
-- Create (Insert)
INSERT INTO DOCTOR (Doctor_ID, Contact_No, Name, Specialization) VALUES 
(1, '9876543210', 'Dr. Sarah Lee', 'Cardiology'),
(2, '8765432109', 'Dr. Michael Chen', 'Neurology'),
(3, '7654321098', 'Dr. Laura King', 'Pediatrics'),
(4, '6543210987', 'Dr. Kevin White', 'Orthopedics'),
(5, '5432109876', 'Dr. Emily Adams', 'Dermatology');

-- Read (Select)
SELECT * FROM DOCTOR;

-- Update
UPDATE DOCTOR 
SET Specialization = 'General Medicine' 
WHERE Doctor_ID = 4;

-- Delete
DELETE FROM DOCTOR WHERE Doctor_ID = 5;

-- 4.	SALE_TRANSACTION
-- Create (Insert)
INSERT INTO SALE_TRANSACTION (Sale_ID, Date, Employee_ID) VALUES 
(1, '2024-11-01', 101),
(2, '2024-11-02', 102),
(3, '2024-11-03', 103),
(4, '2024-11-04', 104),
(5, '2024-11-05', 105);

-- Read (Select)
SELECT * FROM SALE_TRANSACTION;

-- Update
UPDATE SALE_TRANSACTION 
SET Date = '2024-11-10' 
WHERE Sale_ID = 3;

-- Delete
DELETE FROM SALE_TRANSACTION WHERE Sale_ID = 5;

-- 5. PURCHASE
-- Create (Insert)
INSERT INTO PURCHASE (Purchase_ID, Date) VALUES 
(1, '2024-11-01'),
(2, '2024-11-02'),
(3, '2024-11-03'),
(4, '2024-11-04'),
(5, '2024-11-05');

-- Read (Select)
SELECT * FROM PURCHASE;

-- Update
UPDATE PURCHASE 
SET Date = '2024-12-01' 
WHERE Purchase_ID = 2;

-- Delete
DELETE FROM PURCHASE WHERE Purchase_ID = 5;

-- 6. DRUG
-- Create (Insert)
INSERT INTO DRUG (Drug_ID, Location, Cost_Price, Stock, Name, Discount, MRP, Company_ID, Expiry) VALUES 
(1, 'Aisle 1', 10.50, 100, 'Paracetamol', 5, 12.00, 1, '2025-01-01'),
(2, 'Aisle 2', 15.00, 200, 'Ibuprofen', 10, 18.00, 2, '2025-06-01'),
(3, 'Aisle 3', 8.00, 150, 'Cough Syrup', 7, 10.00, 3, '2025-03-01'),
(4, 'Aisle 4', 20.00, 80, 'Antibiotics', 5, 25.00, 4, '2025-08-01'),
(5, 'Aisle 5', 30.00, 50, 'Vitamin C', 0, 35.00, 5, '2025-10-01');

-- Read (Select)
SELECT * FROM DRUG;

-- Update
UPDATE DRUG 
SET Stock = 120 
WHERE Drug_ID = 3;

-- Delete
DELETE FROM DRUG WHERE Drug_ID = 5;

-- 7. DISTRIBUTOR
-- Create (Insert)
INSERT INTO DISTRIBUTOR (Distributor_ID, Contact_No) VALUES 
(1, '1234567890'),
(2, '0987654321'),
(3, '1122334455'),
(4, '2233445566'),
(5, '3344556677');

-- Read (Select)
SELECT * FROM DISTRIBUTOR;

-- Update
UPDATE DISTRIBUTOR 
SET Contact_No = '9998887777' 
WHERE Distributor_ID = 3;

-- Delete
DELETE FROM DISTRIBUTOR WHERE Distributor_ID = 5;

-- 8. EMPLOYEE
-- Create (Insert)
INSERT INTO EMPLOYEE (Employee_ID, Name, Contact_No) VALUES 
(101, 'Alice Walker', '9876543210'),
(102, 'Bob Martin', '8765432109'),
(103, 'Charlie Young', '7654321098'),
(104, 'Diana Prince', '6543210987'),
(105, 'Evan Stone', '5432109876');

-- Read (Select)
SELECT * FROM EMPLOYEE;

-- Update
UPDATE EMPLOYEE 
SET Name = 'Ethan Stone' 
WHERE Employee_ID = 105;

-- Delete
DELETE FROM EMPLOYEE WHERE Employee_ID = 105;

-- 9. SELLS
S -- Create (Insert)
INSERT INTO SELLS (Sale_ID, Drug_ID, Patient_ID, Quantity) VALUES 
(1, 1, 1, 2),
(2, 2, 2, 5),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 1, 4);

-- Read (Select)
SELECT * FROM SELLS;

-- Update
UPDATE SELLS 
SET Quantity = 6 
WHERE Sale_ID = 2 AND Drug_ID = 2 AND Patient_ID = 2;

-- Delete
DELETE FROM SELLS 
WHERE Sale_ID = 5 AND Drug_ID = 5 AND Patient_ID = 1;

-- 10. PRESCRIBES
-- Create (Insert)
INSERT INTO PRESCRIBES (Patient_ID, Doctor_ID, Drug_ID) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Read (Select)
SELECT * FROM PRESCRIBES;

-- Update
UPDATE PRESCRIBES 
SET Drug_ID = 4 
WHERE Patient_ID = 3 AND Doctor_ID = 3 AND Drug_ID = 3;

-- Delete
DELETE FROM PRESCRIBES 
WHERE Patient_ID = 5 AND Doctor_ID = 5 AND Drug_ID = 5;

-- 11. SUPPLIES
-- Create (Insert)
INSERT INTO SUPPLIES (Quantity, Purchase_ID, Distributor_ID, Drug_ID) VALUES 
(100, 1, 1, 1),
(200, 2, 2, 2),
(150, 3, 3, 3),
(80, 4, 4, 4),
(50, 5, 5, 5);

-- Read (Select)
SELECT * FROM SUPPLIES;

-- Update
UPDATE SUPPLIES 
SET Quantity = 250 
WHERE Purchase_ID = 2 AND Distributor_ID = 2 AND Drug_ID = 2;

-- Delete
DELETE FROM SUPPLIES 
WHERE Purchase_ID = 5 AND Distributor_ID = 5 AND Drug_ID = 5;

