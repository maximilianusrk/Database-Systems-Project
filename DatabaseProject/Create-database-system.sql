CREATE DATABASE lADtop
USE lADtop


CREATE TABLE [Customer] (
    CustomerID VARCHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]') NOT NULL,
    CustomerName VARCHAR(50)  CHECK(LEN(CustomerName) > 2) NOT NULL,
    CustomerGender VARCHAR(10) NOT NULL check (CustomerGender in ('Male', 'Female')) ,
    CustomerAddress VARCHAR(50) NOT NULL,
    CustomerPhoneNumber INT NOT NULL,
    CustomerEmail VARCHAR(50) NOT NULL check (CustomerEmail LIKE '%@gmail.com' OR CustomerEmail LIKE '%@yahoo.com')
);

CREATE TABLE [Staff] (
    StaffID VARCHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]') NOT NULL,
    StaffName VARCHAR(50) NOT NULL,
    StaffGender CHAR(10) NOT NULL check (StaffGender in ('Male', 'Female')),
    StaffPhoneNumber INT NOT NULL,
    StaffEmail VARCHAR(50) NOT NULL check (StaffEmail LIKE '%@gmail.com' OR StaffEmail LIKE '%@yahoo.com'),
    StaffAddress VARCHAR(50) NOT NULL,
    StaffSalary FLOAT NOT NULL CHECK (StaffSalary >=5000000 and StaffSalary <= 10000000),
);

CREATE TABLE [Vendor] (
    VendorID VARCHAR(5) PRIMARY KEY CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]') NOT NULL,
    VendorName VARCHAR(50) NOT NULL,
    VendorEmail VARCHAR(50) CHECK(VendorEmail LIKE '%@gmail.com' OR VendorEmail LIKE '%@yahoo.com') NOT NULL,
    VendorPhoneNumber INT NOT NULL,
    VendorAddress VARCHAR(50) NOT NULL,
);

CREATE TABLE [Brand] (
	BrandID VARCHAR (5) PRIMARY KEY CHECK(BrandID LIKE 'LB[0-9][0-9][0-9]') NOT NULL,
	BrandName VARCHAR (10) NOT NULL
);

CREATE TABLE [Laptop](
    LaptopID VARCHAR (5) PRIMARY KEY NOT NULL,
    BrandID VARCHAR (5) FOREIGN KEY REFERENCES Brand(BrandID) NOT NULL,
    LaptopName VARCHAR (255) NOT NULL,
    LaptopPrice INT CHECK (LaptopPrice >= 5000000) NOT NULL,
    CONSTRAINT LaptopID CHECK(LaptopID LIKE 'LA[0-9][0-9][0-9]')
);

CREATE TABLE [Purchase] (
    PurchaseID VARCHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]') NOT NULL,
    VendorID VARCHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID) not null,
    StaffID VARCHAR (5) foreign key references Staff(StaffID) not null,
    PurchaseDate DATE CHECK(PurchaseDate <= CONVERT(DATE, GETDATE())) not null,
); 

CREATE TABLE [PurchaseDetail] (
	PurchaseID VARCHAR(5) FOREIGN KEY REFERENCES Purchase(PurchaseID) NOT NULL,
	LaptopID VARCHAR(5) FOREIGN KEY REFERENCES Laptop(LaptopID) NOT NULL,
	Quantity INT NOT NULL,
);

CREATE TABLE [Transactions]( 
	TransactionID VARCHAR(5) PRIMARY KEY CHECK (TransactionID LIKE 'TR[0-9][0-9][0-9]') NOT NULL,
    StaffID VARCHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) not null,
    CustomerID VARCHAR (5) foreign key references Customer(CustomerID) not null,
    TransactionDate DATE CHECK(TransactionDate <= CONVERT(DATE, GETDATE())) not null,
);

CREATE TABLE [TransactionDetail] (
	TransactionID VARCHAR(5) FOREIGN KEY REFERENCES Transactions(TransactionID) NOT NULL,
	LaptopID VARCHAR(5) FOREIGN KEY REFERENCES Laptop(LaptopID) NOT NULL,
	Quantity INT NOT NULL,
);
