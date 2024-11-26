SELECT DOC.Name AS Doctor_Name, DOC.Specialization AS Specialization , PRES.Drug_ID, DR.Name AS  Drug_Name, CUSTOMER.Name AS Customer_Name, DM.Name AS Manufacturer_Name
FROM
PRESCRIBES PRES
JOIN
DOCTOR DOC ON PRES