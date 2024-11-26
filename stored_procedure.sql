-- DRUG_MANUFACTURER
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddDrugManufacturer(IN p_Name VARCHAR(255))
BEGIN
    INSERT INTO DRUG_MANUFACTURER (Name) VALUES (p_Name);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetDrugManufacturers()
BEGIN
    SELECT * FROM DRUG_MANUFACTURER;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateDrugManufacturer(IN p_Company_ID INT, IN p_Name VARCHAR(255))
BEGIN
    UPDATE DRUG_MANUFACTURER SET Name = p_Name WHERE Company_ID = p_Company_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteDrugManufacturer(IN p_Company_ID INT)
BEGIN
    DELETE FROM DRUG_MANUFACTURER WHERE Company_ID = p_Company_ID;
END $$
DELIMITER ;

-- DOCTOR
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddDoctor(IN p_Name VARCHAR(255), IN p_Contact_No VARCHAR(20), IN p_Specialization VARCHAR(255))
BEGIN
    INSERT INTO DOCTOR (Name, Contact_No, Specialization) VALUES (p_Name, p_Contact_No, p_Specialization);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetDoctors()
BEGIN
    SELECT * FROM DOCTOR;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateDoctor(IN p_Doctor_ID INT, IN p_Specialization VARCHAR(255))
BEGIN
    UPDATE DOCTOR SET Specialization = p_Specialization WHERE Doctor_ID = p_Doctor_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteDoctor(IN p_Doctor_ID INT)
BEGIN
    DELETE FROM DOCTOR WHERE Doctor_ID = p_Doctor_ID;
END $$
DELIMITER ;

-- SALE_TRANSACTION
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddSaleTransaction(IN p_Date DATE, IN p_Employee_ID INT)
BEGIN
    INSERT INTO SALE_TRANSACTION (Date, Employee_ID) VALUES (p_Date, p_Employee_ID);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetSaleTransactions()
BEGIN
    SELECT * FROM SALE_TRANSACTION;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateSaleTransaction(IN p_Sale_ID INT, IN p_Date DATE)
BEGIN
    UPDATE SALE_TRANSACTION SET Date = p_Date WHERE Sale_ID = p_Sale_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteSaleTransaction(IN p_Sale_ID INT)
BEGIN
    DELETE FROM SALE_TRANSACTION WHERE Sale_ID = p_Sale_ID;
END $$
DELIMITER ;

-- PURCHASE
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddPurchase(IN p_Date DATE)
BEGIN
    INSERT INTO PURCHASE (Date) VALUES (p_Date);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetPurchases()
BEGIN
    SELECT * FROM PURCHASE;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdatePurchase(IN p_Purchase_ID INT, IN p_Date DATE)
BEGIN
    UPDATE PURCHASE SET Date = p_Date WHERE Purchase_ID = p_Purchase_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeletePurchase(IN p_Purchase_ID INT)
BEGIN
    DELETE FROM PURCHASE WHERE Purchase_ID = p_Purchase_ID;
END $$
DELIMITER ;

-- DRUG
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddDrug(IN p_Location VARCHAR(255), IN p_Cost_Price DECIMAL(10,2), IN p_Stock INT, IN p_Name VARCHAR(255), IN p_Discount DECIMAL(5,2), IN p_MRP DECIMAL(10,2), IN p_Company_ID INT, IN p_Expiry DATE)
BEGIN
    INSERT INTO DRUG (Location, Cost_Price, Stock, Name, Discount, MRP, Company_ID, Expiry) 
    VALUES (p_Location, p_Cost_Price, p_Stock, p_Name, p_Discount, p_MRP, p_Company_ID, p_Expiry);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetDrugs()
BEGIN
    SELECT * FROM DRUG;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateDrug(IN p_Drug_ID INT, IN p_Stock INT)
BEGIN
    UPDATE DRUG SET Stock = p_Stock WHERE Drug_ID = p_Drug_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteDrug(IN p_Drug_ID INT)
BEGIN
    DELETE FROM DRUG WHERE Drug_ID = p_Drug_ID;
END $$
DELIMITER ;

-- SELLS
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddSell(IN p_Sale_ID INT, IN p_Drug_ID INT, IN p_Patient_ID INT, IN p_Quantity INT)
BEGIN
    INSERT INTO SELLS (Sale_ID, Drug_ID, Patient_ID, Quantity) 
    VALUES (p_Sale_ID, p_Drug_ID, p_Patient_ID, p_Quantity);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetSells()
BEGIN
    SELECT * FROM SELLS;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateSell(IN p_Sale_ID INT, IN p_Drug_ID INT, IN p_Patient_ID INT, IN p_Quantity INT)
BEGIN
    UPDATE SELLS SET Quantity = p_Quantity WHERE Sale_ID = p_Sale_ID AND Drug_ID = p_Drug_ID AND Patient_ID = p_Patient_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteSell(IN p_Sale_ID INT, IN p_Drug_ID INT, IN p_Patient_ID INT)
BEGIN
    DELETE FROM SELLS WHERE Sale_ID = p_Sale_ID AND Drug_ID = p_Drug_ID AND Patient_ID = p_Patient_ID;
END $$
DELIMITER ;

-- PRESCRIBES
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddPrescription(IN p_Patient_ID INT, IN p_Doctor_ID INT, IN p_Drug_ID INT)
BEGIN
    INSERT INTO PRESCRIBES (Patient_ID, Doctor_ID, Drug_ID) 
    VALUES (p_Patient_ID, p_Doctor_ID, p_Drug_ID);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetPrescriptions()
BEGIN
    SELECT * FROM PRESCRIBES;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdatePrescription(IN p_Patient_ID INT, IN p_Doctor_ID INT, IN p_Drug_ID INT)
BEGIN
    UPDATE PRESCRIBES SET Drug_ID = p_Drug_ID WHERE Patient_ID = p_Patient_ID AND Doctor_ID = p_Doctor_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeletePrescription(IN p_Patient_ID INT, IN p_Doctor_ID INT, IN p_Drug_ID INT)
BEGIN
    DELETE FROM PRESCRIBES WHERE Patient_ID = p_Patient_ID AND Doctor_ID = p_Doctor_ID AND Drug_ID = p_Drug_ID;
END $$
DELIMITER ;

-- SUPPLIES
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddSupply(IN p_Quantity INT, IN p_Purchase_ID INT, IN p_Distributor_ID INT, IN p_Drug_ID INT)
BEGIN
    INSERT INTO SUPPLIES (Quantity, Purchase_ID, Distributor_ID, Drug_ID) 
    VALUES (p_Quantity, p_Purchase_ID, p_Distributor_ID, p_Drug_ID);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetSupplies()
BEGIN
    SELECT * FROM SUPPLIES;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateSupply(IN p_Purchase_ID INT, IN p_Distributor_ID INT, IN p_Drug_ID INT, IN p_Quantity INT)
BEGIN
    UPDATE SUPPLIES SET Quantity = p_Quantity WHERE Purchase_ID = p_Purchase_ID AND Distributor_ID = p_Distributor_ID AND Drug_ID = p_Drug_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteSupply(IN p_Purchase_ID INT, IN p_Distributor_ID INT, IN p_Drug_ID INT)
BEGIN
    DELETE FROM SUPPLIES WHERE Purchase_ID = p_Purchase_ID AND Distributor_ID = p_Distributor_ID AND Drug_ID = p_Drug_ID;
END $$
DELIMITER ;

-- DISTRIBUTOR
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddDistributor(IN p_Contact_No VARCHAR(20))
BEGIN
    INSERT INTO DISTRIBUTOR (Contact_No) VALUES (p_Contact_No);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetDistributors()
BEGIN
    SELECT * FROM DISTRIBUTOR;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateDistributor(IN p_Distributor_ID INT, IN p_Contact_No VARCHAR(20))
BEGIN
    UPDATE DISTRIBUTOR SET Contact_No = p_Contact_No WHERE Distributor_ID = p_Distributor_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteDistributor(IN p_Distributor_ID INT)
BEGIN
    DELETE FROM DISTRIBUTOR WHERE Distributor_ID = p_Distributor_ID;
END $$
DELIMITER ;

-- EMPLOYEE
-- Create Procedure for INSERT
DELIMITER $$
CREATE PROCEDURE AddEmployee(IN p_Name VARCHAR(255), IN p_Contact_No VARCHAR(20))
BEGIN
    INSERT INTO EMPLOYEE (Name, Contact_No) VALUES (p_Name, p_Contact_No);
END $$
DELIMITER ;

-- Read Procedure
DELIMITER $$
CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM EMPLOYEE;
END $$
DELIMITER ;

-- Update Procedure
DELIMITER $$
CREATE PROCEDURE UpdateEmployee(IN p_Employee_ID INT, IN p_Name VARCHAR(255), IN p_Contact_No VARCHAR(20))
BEGIN
    UPDATE EMPLOYEE SET Name = p_Name, Contact_No = p_Contact_No WHERE Employee_ID = p_Employee_ID;
END $$
DELIMITER ;

-- Delete Procedure
DELIMITER $$
CREATE PROCEDURE DeleteEmployee(IN p_Employee_ID INT)
BEGIN
    DELETE FROM EMPLOYEE WHERE Employee_ID = p_Employee_ID;
END $$
DELIMITER ;
