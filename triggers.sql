-- Trigger on UPDATE: Ensures the address is not empty when updating
DELIMITER //
CREATE TRIGGER BeforeUpdateCustomer
BEFORE UPDATE ON CUSTOMER
FOR EACH ROW
BEGIN
    IF NEW.Address IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Address cannot be NULL';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Ensures no customer can be deleted if they have related sales
DELIMITER //
CREATE TRIGGER BeforeDeleteCustomer
BEFORE DELETE ON CUSTOMER
FOR EACH ROW
BEGIN
    DECLARE customer_exists INT;
    SELECT COUNT(*) INTO customer_exists
    FROM SELLS
    WHERE Patient_ID = OLD.Patient_ID;
    IF customer_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete customer with existing sales records';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures the manufacturer name is not empty
DELIMITER //
CREATE TRIGGER BeforeInsertDrugManufacturer
BEFORE INSERT ON DRUG_MANUFACTURER
FOR EACH ROW
BEGIN
    IF NEW.Name IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Manufacturer name cannot be NULL';
    END IF;
END //
DELIMITER ;

-- Trigger on UPDATE: Ensures the name is not updated to NULL
DELIMITER //
CREATE TRIGGER BeforeUpdateDrugManufacturer
BEFORE UPDATE ON DRUG_MANUFACTURER
FOR EACH ROW
BEGIN
    IF NEW.Name IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Manufacturer name cannot be NULL';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Prevents deleting a manufacturer if drugs are still associated
DELIMITER //
CREATE TRIGGER BeforeDeleteDrugManufacturer
BEFORE DELETE ON DRUG_MANUFACTURER
FOR EACH ROW
BEGIN
    DECLARE manufacturer_exists INT;
    SELECT COUNT(*) INTO manufacturer_exists
    FROM DRUG
    WHERE Company_ID = OLD.Company_ID;
    IF manufacturer_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete manufacturer with existing drugs';
    END IF;
END //
DELIMITER ;


-- Trigger on INSERT: Ensures doctor's contact number is not empty
DELIMITER //
CREATE TRIGGER BeforeInsertDoctor
BEFORE INSERT ON DOCTOR
FOR EACH ROW
BEGIN
    IF NEW.Contact_No IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Doctor contact number cannot be NULL';
    END IF;
END //
DELIMITER ;

-- Trigger on UPDATE: Ensures specialization is not NULL
DELIMITER //
CREATE TRIGGER BeforeUpdateDoctor
BEFORE UPDATE ON DOCTOR
FOR EACH ROW
BEGIN
    IF NEW.Specialization IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Doctor specialization cannot be NULL';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Prevents deletion of doctor if they have related prescriptions
DELIMITER //
CREATE TRIGGER BeforeDeleteDoctor
BEFORE DELETE ON DOCTOR
FOR EACH ROW
BEGIN
    DECLARE doctor_exists INT;
    SELECT COUNT(*) INTO doctor_exists
    FROM PRESCRIBES
    WHERE Doctor_ID = OLD.Doctor_ID;
    IF doctor_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete doctor with existing prescriptions';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures employee ID is valid
DELIMITER //
CREATE TRIGGER BeforeInsertSaleTransaction
BEFORE INSERT ON SALE_TRANSACTION
FOR EACH ROW
BEGIN
    DECLARE employee_exists INT;
    SELECT COUNT(*) INTO employee_exists
    FROM EMPLOYEE
    WHERE Employee_ID = NEW.Employee_ID;
    IF employee_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Employee ID';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Prevents deletion of sale transactions if they are linked to sales
DELIMITER //
CREATE TRIGGER BeforeDeleteSaleTransaction
BEFORE DELETE ON SALE_TRANSACTION
FOR EACH ROW
BEGIN
    DECLARE sale_exists INT;
    SELECT COUNT(*) INTO sale_exists
    FROM SELLS
    WHERE Sale_ID = OLD.Sale_ID;
    IF sale_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete sale transaction with existing sales';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures the purchase date is not in the future
DELIMITER //
CREATE TRIGGER BeforeInsertPurchase
BEFORE INSERT ON PURCHASE
FOR EACH ROW
BEGIN
    IF NEW.Date > CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Purchase date cannot be in the future';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Ensures a purchase cannot be deleted if related to supplies
DELIMITER //
CREATE TRIGGER BeforeDeletePurchase
BEFORE DELETE ON PURCHASE
FOR EACH ROW
BEGIN
    DECLARE purchase_exists INT;
    SELECT COUNT(*) INTO purchase_exists
    FROM SUPPLIES
    WHERE Purchase_ID = OLD.Purchase_ID;
    IF purchase_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete purchase with existing supplies';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures drug stock is not negative
DELIMITER //
CREATE TRIGGER BeforeInsertDrug
BEFORE INSERT ON DRUG
FOR EACH ROW
BEGIN
    IF NEW.Stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Drug stock cannot be negative';
    END IF;
END //
DELIMITER ;

-- Trigger on UPDATE: Ensures stock is not negative
DELIMITER //
CREATE TRIGGER BeforeUpdateDrug
BEFORE UPDATE ON DRUG
FOR EACH ROW
BEGIN
    IF NEW.Stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Drug stock cannot be negative';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Prevents deletion if drug is associated with supplies
DELIMITER //
CREATE TRIGGER BeforeDeleteDrug
BEFORE DELETE ON DRUG
FOR EACH ROW
BEGIN
    DECLARE drug_exists INT;
    SELECT COUNT(*) INTO drug_exists
    FROM SUPPLIES
    WHERE Drug_ID = OLD.Drug_ID;
    IF drug_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete drug with existing supplies';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures quantity is positive
DELIMITER //
CREATE TRIGGER BeforeInsertSell
BEFORE INSERT ON SELLS
FOR EACH ROW
BEGIN
    IF NEW.Quantity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantity cannot be zero or negative';
    END IF;
END //
DELIMITER ;

-- Trigger on UPDATE: Ensures quantity is positive
DELIMITER //
CREATE TRIGGER BeforeUpdateSell
BEFORE UPDATE ON SELLS
FOR EACH ROW
BEGIN
    IF NEW.Quantity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantity cannot be zero or negative';
    END IF;
END //
DELIMITER ;


-- Trigger on INSERT: Ensures that the drug prescribed is in stock
DELIMITER //
CREATE TRIGGER BeforeInsertPrescription
BEFORE INSERT ON PRESCRIBES
FOR EACH ROW
BEGIN
    DECLARE drug_in_stock INT;
    SELECT Stock INTO drug_in_stock
    FROM DRUG
    WHERE Drug_ID = NEW.Drug_ID;
    IF drug_in_stock <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Drug is out of stock';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures supply quantity is not negative
DELIMITER //
CREATE TRIGGER BeforeInsertSupply
BEFORE INSERT ON SUPPLIES
FOR EACH ROW
BEGIN
    IF NEW.Quantity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Supply quantity cannot be zero or negative';
    END IF;
END //
DELIMITER ;

-- Trigger on UPDATE: Ensures supply quantity is not negative
DELIMITER //
CREATE TRIGGER BeforeUpdateSupply
BEFORE UPDATE ON SUPPLIES
FOR EACH ROW
BEGIN
    IF NEW.Quantity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Supply quantity cannot be zero or negative';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures the contact number is valid
DELIMITER //
CREATE TRIGGER BeforeInsertDistributor
BEFORE INSERT ON DISTRIBUTOR
FOR EACH ROW
BEGIN
    IF NEW.Contact_No IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Distributor contact number cannot be NULL';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Prevents deletion of distributor if related to supplies
DELIMITER //
CREATE TRIGGER BeforeDeleteDistributor
BEFORE DELETE ON DISTRIBUTOR
FOR EACH ROW
BEGIN
    DECLARE distributor_exists INT;
    SELECT COUNT(*) INTO distributor_exists
    FROM SUPPLIES
    WHERE Distributor_ID = OLD.Distributor_ID;
    IF distributor_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete distributor with existing supplies';
    END IF;
END //
DELIMITER ;

-- Trigger on INSERT: Ensures employee name is not empty
DELIMITER //
CREATE TRIGGER BeforeInsertEmployee
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF NEW.Name IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee name cannot be NULL';
    END IF;
END //
DELIMITER ;

-- Trigger on DELETE: Prevents deletion of employee if related to sale transactions
DELIMITER //
CREATE TRIGGER BeforeDeleteEmployee
BEFORE DELETE ON EMPLOYEE
FOR EACH ROW
BEGIN
    DECLARE employee_exists INT;
    SELECT COUNT(*) INTO employee_exists
    FROM SALE_TRANSACTION
    WHERE Employee_ID = OLD.Employee_ID;
    IF employee_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete employee with existing sale transactions';
    END IF;
END //
DELIMITER ;


