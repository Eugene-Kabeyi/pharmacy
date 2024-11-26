-- Total Sales Report by Customer
SELECT C.Name AS Customer_Name, SUM(S.Quantity * D.MRP) AS Total_Sales_Value FROM CUSTOMER C JOIN SELLS S ON C.Patient_ID = S.Patient_ID JOIN DRUG D ON S.Drug_ID = D.Drug_ID GROUP BY C.Patient_ID ORDER BY Total_Sales_Value DESC; 
-- Doctor Prescription Report
SELECT D.Name AS Doctor_Name, DR.Name AS Drug_Name, COUNT(P.Drug_ID) AS Prescription_Count FROM DOCTOR D JOIN PRESCRIBES P ON D.Doctor_ID = P.Doctor_ID JOIN DRUG DR ON P.Drug_ID = DR.Drug_ID GROUP BY D.Doctor_ID, DR.Drug_ID ORDER BY Prescription_Count DESC; 
-- Stock Availability Report
SELECT D.Name AS Drug_Name, D.Stock AS Available_Stock, D.Expiry AS Expiry_Date FROM DRUG D WHERE D.Stock > 0 ORDER BY D.Stock DESC; 
-- Total Purchase Report 
SELECT P.Purchase_ID, P.Date AS Purchase_Date, SUM(S.Quantity * DR.MRP) AS Total_Purchase_Value FROM PURCHASE P JOIN SUPPLIES S ON P.Purchase_ID = S.Purchase_ID JOIN DRUG DR ON S.Drug_ID = DR.Drug_ID GROUP BY P.Purchase_ID ORDER BY Total_Purchase_Value DESC; 
-- Drug Sales Report
SELECT DR.Name AS Drug_Name, SUM(S.Quantity) AS Total_Quantity_Sold, SUM(S.Quantity * DR.MRP) AS Total_Sales_Value FROM DRUG DR JOIN SELLS S ON DR.Drug_ID = S.Drug_ID GROUP BY DR.Drug_ID ORDER BY Total_Sales_Value DESC; 
-- Employee Sales Performance Report
SELECT E.Name AS Employee_Name, SUM(S.Quantity * DR.MRP) AS Total_Sales_Value FROM EMPLOYEE E JOIN SALE_TRANSACTION ST ON E.Employee_ID = ST.Employee_ID JOIN SELLS S ON ST.Sale_ID = S.Sale_ID JOIN DRUG DR ON S.Drug_ID = DR.Drug_ID GROUP BY E.Employee_ID ORDER BY Total_Sales_Value DESC; 
-- Customer Prescription Report
SELECT C.Name AS Customer_Name, DR.Name AS Drug_Name, COUNT(P.Drug_ID) AS Prescription_Count FROM CUSTOMER C JOIN PRESCRIBES P ON C.Patient_ID = P.Patient_ID JOIN DRUG DR ON P.Drug_ID = DR.Drug_ID GROUP BY C.Patient_ID, DR.Drug_ID ORDER BY Prescription_Count DESC; 
-- Drug Manufacturer Report
SELECT M.Name AS Manufacturer_Name, SUM(S.Quantity * D.MRP) AS Total_Supply_Value FROM DRUG_MANUFACTURER M JOIN DRUG D ON M.Company_ID = D.Company_ID JOIN SUPPLIES S ON D.Drug_ID = S.Drug_ID GROUP BY M.Company_ID ORDER BY Total_Supply_Value DESC; 
-- Sales Transactions Report
SELECT ST.Sale_ID, ST.Date AS Sale_Date, E.Name AS Employee_Name, D.Name AS Drug_Name, S.Quantity AS Quantity_Sold FROM SALE_TRANSACTION ST JOIN EMPLOYEE E ON ST.Employee_ID = E.Employee_ID JOIN SELLS S ON ST.Sale_ID = S.Sale_ID JOIN DRUG D ON S.Drug_ID = D.Drug_ID ORDER BY Sale_Date DESC; 
-- Distributor Drug Supply Report
SELECT D.Name AS Distributor_Name, DR.Name AS Drug_Name, SUM(S.Quantity) AS Quantity_Supplied FROM DISTRIBUTOR D JOIN SUPPLIES S ON D.Distributor_ID = S.Distributor_ID JOIN DRUG DR ON S.Drug_ID = DR.Drug_ID GROUP BY D.Distributor_ID, DR.Drug_ID ORDER BY Distributor_Name, Drug_Name; 
-- Drug Expiry Report
SELECT D.Name AS Drug_Name, D.Expiry AS Expiry_Date FROM DRUG D WHERE D.Expiry <= CURDATE() + INTERVAL 1 MONTH ORDER BY D.Expiry; 