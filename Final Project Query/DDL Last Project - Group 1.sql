CREATE DATABASE BluejackJewelry
GO
USE BluejackJewelry
GO

CREATE TABLE [MsStaff] (
	StaffID CHAR (5) PRIMARY KEY NOT NULL CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) CHECK (LEN(StaffName) > 3) NOT NULL,
	StaffGender VARCHAR(10) CHECK (StaffGender IN  ('Male', 'Female'))NOT NULL,
	StaffEmail VARCHAR(50) CHECK (StaffEmail LIKE '%st.com') NOT NULL,
	StaffAddress VARCHAR(50) NOT NULL,
	StaffPhone VARCHAR(16) CHECK (StaffPhone LIKE '08%') NOT NULL,
);

CREATE TABLE [MsCustomer] (
	CustomerID CHAR (5) PRIMARY KEY NOT NULL CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) CHECK (LEN(CustomerName) > 3) NOT NULL,
	CustomerGender VARCHAR(10) CHECK (CustomerGender IN  ('Male', 'Female'))NOT NULL,
	CustomerEmail VARCHAR(50) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
	CustomerPhone VARCHAR (16) CHECK (CustomerPhone LIKE '08%') NOT NULL,
);

CREATE TABLE [MsVendor](
	VendorID CHAR (5) PRIMARY KEY NOT NULL CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) CHECK (LEN(VendorName) > 3) NOT NULL,
	VendorEmail VARCHAR(50) CHECK (VendorEmail LIKE '%ve.com') NOT NULL, 
	VendorAddress VARCHAR(50) CHECK (VendorAddress LIKE '% [0-9] street')NOT NULL,
	VendorPhone VARCHAR (16) CHECK (VendorPhone LIKE '08%') NOT NULL,
);

CREATE TABLE [MsJewelryType] (
	JewelryTypeID CHAR (5) PRIMARY KEY NOT NULL CHECK (JewelryTypeID LIKE 'JT[0-9][0-9][0-9]'),
	JewelryTypeName VARCHAR (50) NOT NULL,
);

CREATE TABLE [MsJewelry] (
	JewelryID CHAR (5) PRIMARY KEY NOT NULL CHECK (JewelryID LIKE 'JW[0-9][0-9][0-9]'),
	JewelryTypeID CHAR (5) FOREIGN KEY REFERENCES MsJewelryType(JewelryTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	JewelryName VARCHAR (50) NOT NULL,
	JewelryWeight INT CHECK(JewelryWeight BETWEEN 10 AND 1000) NOT NULL,
	JewelryPurchasePrice INT NOT NULL,
	JewelrySalesPrice INT NOT NULL,
	JewelryStock INT NOT NULL,
);

CREATE TABLE [PurchaseTransaction](
	TransactionID CHAR (5) PRIMARY KEY NOT NULL CHECK (TransactionID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR (5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR (5) FOREIGN KEY REFERENCES MsVendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL,
);

CREATE TABLE [PurchaseTransactionDetail](
	TransactionID CHAR (5) FOREIGN KEY REFERENCES PurchaseTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	JewelryID CHAR (5) FOREIGN KEY REFERENCES MsJewelry(JewelryID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT CHECK(Quantity > 0) NOT NULL,
);

CREATE TABLE [SalesTransaction](
	SalesID CHAR (5) PRIMARY KEY NOT NULL CHECK (SalesID LIKE 'SL[0-9][0-9][0-9]'),
	StaffID CHAR (5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR (5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesDate DATE NOT NULL,
);

CREATE TABLE [SalesTransactionDetail](
	SalesID CHAR (5) FOREIGN KEY REFERENCES SalesTransaction(SalesID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	JewelryID CHAR (5) FOREIGN KEY REFERENCES MsJewelry(JewelryID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT CHECK (Quantity > 0) NOT NULL,
);


