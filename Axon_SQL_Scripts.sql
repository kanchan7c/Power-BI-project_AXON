# Setting the current database for use 
USE classicmodels;

# Displaying all the tables that the database consists
SHOW TABLES;

# Checking the table information for table properties and constraints
DESCRIBE customers;
DESCRIBE employees;
DESCRIBE offices;
DESCRIBE orderdetails;
DESCRIBE orders;
DESCRIBE payments;
DESCRIBE productlines;
DESCRIBE products;

SELECT 
    COUNT(*)
FROM
    customers;

SELECT 
    *
FROM
    customers;

##############################################
# Cleaning and formatting customers table data
# creating view to extract useful columns and modifying the data
DROP VIEW IF EXISTS customers_cleaned;
CREATE VIEW customers_cleaned AS
    SELECT 
        customerNumber,
        customerName,
        IFNULL(CONCAT(contactFirstName, ' ', contactLastName),
                'N/A') AS contactFullName,
        phone,
        IFNULL(CONCAT(addressLine1, ' ', addressLine2),
                'N/A') AS customerAddress,
        city,
        IFNULL(state, 'N/A') AS state_filled,
        IFNULL(postalCode, 'N/A') AS postalCode_filled,
        IFNULL(salesRepEmployeeNumber, '0') AS employeeNumber_filled,
        creditLimit
    FROM
        customers;
SELECT 
    *
FROM
    customers_cleaned;

##############################################
# Cleaning and formatting employees table data
# creating view to extract useful columns and modifying the data
DROP VIEW IF EXISTS employees_cleaned;
CREATE VIEW employees_cleaned AS
    SELECT 
        employeeNumber,
        CONCAT(firstName, ' ', lastName) AS emoployeeName,
        IFNULL(extension, 'N/A') AS extension,
        email,
        officeCode,
        IFNULL(reportsTo, 0) AS reportsTo,
        jobTitle
    FROM
        employees;
SELECT 
    *
FROM
    employees_cleaned;

##############################################
# Cleaning and formatting offices table data
# creating view to extract useful columns and modifying the data
DROP VIEW IF EXISTS offices_cleaned;
CREATE VIEW offices_cleaned AS
SELECT
	officeCode,
    city,
    phone,
    IFNULL(CONCAT(addressLine1,' ',addressLine2), 'N/A') AS officeAddress,
    IFNULL(state, 'N/A') AS state,
    IFNULL(country, 'N/A') AS country,
    IFNULL(postalCode, 'N/A') AS postalCode,
    IFNULL(territory, 'N/A') AS territory
FROM
	offices;
SELECT 
	*
FROM
	offices_cleaned;
    
##############################################
# Cleaning and formatting orders table data
# creating view to extract useful columns and modifying the data
DROP VIEW IF EXISTS orders_cleaned;
CREATE VIEW orders_cleaned AS
SELECT
	orderNumber,
    orderDate,
    requiredDate,
    shippedDate,
    status as orderStatus,
    ifnull(comments, 'N/A') as comments,
    customerNumber
FROM
	orders;
SELECT
	*
FROM
	orders_cleaned;
    
##############################################
# Cleaning and formatting productlines table data
# creating view to extract useful columns and modifying the data
DROP VIEW IF EXISTS productlines_cleaned;
CREATE VIEW productlines_cleaned AS
SELECT
	productLine,
    textDescription
FROM
	productlines;
SELECT
	*
FROM
	productlines_cleaned;

