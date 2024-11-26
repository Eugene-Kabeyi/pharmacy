# pharmacy
Pharmacy Inventory Management System
Overview
The Pharmacy Inventory Management System is a relational database-driven solution designed to streamline inventory tracking, prescription management, sales, purchases, and supplier relations for a pharmacy.

Features
Customer Management: Tracks patient details and purchase history.
Drug Inventory Management: Monitors stock levels, expiry dates, and suppliers.
Prescription Handling: Links doctors, patients, and prescribed drugs.
Sales and Purchases: Logs transactions and supplier information.
Reports and Analytics: Provides insights into sales, stock levels, and supplier performance.
Data Security: Ensures data consistency and integrity.
Prerequisites
Before setting up the system, ensure the following are installed:

MySQL (version 8.0 or later)
MySQL Workbench or any other database client
Git (optional, for version control)
Text Editor (e.g., VSCode, Sublime Text)
Setup Instructions
1. Clone or Download the Project
If using Git:

bash
Copy code
git clone https://github.com/your-repo/pharmacy-inventory-system.git
cd pharmacy-inventory-system
Or manually download the project and unzip it.

2. Set Up the Database
Open MySQL Workbench or your preferred database client.
Create a new database:
sql
Copy code
CREATE DATABASE pharmacy_db;
Import the SQL schema and data:
Locate the pharmacy_system.sql file in the project directory.
Run the file to set up tables, triggers, views, and stored procedures:
bash
Copy code
mysql -u your_username -p pharmacy_db < pharmacy_system.sql
3. Verify the Setup
Open the database and check for the following tables:
CUSTOMER
DRUG_MANUFACTURER
DOCTOR
SALE_TRANSACTION
PURCHASE
SELLS
PRESCRIBES
DRUG
SUPPLIES
DISTRIBUTOR
EMPLOYEE
Ensure that all stored procedures, triggers, and views are also imported successfully.
4. Test the System
Insert test data if none exists. Use the provided test_data.sql file to populate tables with sample entries:
bash
Copy code
mysql -u your_username -p pharmacy_db < test_data.sql
Run basic queries to verify the relationships between tables:
sql
Copy code
SELECT * FROM DRUG;
SELECT * FROM PRESCRIBES;
5. Customize Configuration
If needed, modify configuration files for your local environment (e.g., database connection details in an application).

Usage
Advanced Queries: Run pre-written SQL queries in the queries.sql file for analytics and reporting.
Triggers: Automatic execution of defined actions (e.g., stock updates).
Views: Simplify reporting by querying pre-defined views.
Troubleshooting
Missing Tables or Data: Re-import the SQL schema and test data files.
Connection Issues: Verify MySQL server is running and credentials are correct.
Error Messages: Refer to the SQL error log or contact the developer.
