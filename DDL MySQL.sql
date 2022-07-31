CREATE DATABASE Northwind;

USE Northwind;

CREATE TABLE Employees (
	EmployeeID int AUTO_INCREMENT NOT NULL Primary key,
	LastName nvarchar (20) NOT NULL ,
	FirstName nvarchar (10) NOT NULL ,
	Title nvarchar (30) NULL ,
	TitleOfCourtesy nvarchar (25) NULL ,
	BirthDate datetime,
	HireDate datetime,
	Address nvarchar (60) NULL ,
	City nvarchar (15) NULL ,
	Region nvarchar (15) NULL ,
	PostalCode nvarchar (10) NULL ,
	Country nvarchar (15) NULL ,
	HomePhone nvarchar (24) NULL ,
	Extension nvarchar (4) NULL ,
	Photo blob NULL ,
	Notes nvarchar (100) NULL ,
	ReportsTo int NULL ,
	PhotoPath nvarchar (255) NULL 
);


CREATE TABLE Categories (
	CategoryID int AUTO_INCREMENT NOT NULL ,
	CategoryName nvarchar (15) NOT NULL ,
	Description nvarchar (200) NULL ,
	Picture blob NULL ,
	CONSTRAINT PK_Categories PRIMARY KEY  CLUSTERED 
	(
		CategoryID
	)
);


CREATE TABLE Customers(
	CustomerID nchar (5) NOT NULL ,
	CompanyName nvarchar (40) NOT NULL ,
	ContactName nvarchar (30) NULL ,
	ContactTitle nvarchar (30) NULL ,
	Address nvarchar (60) NULL ,
	City nvarchar (15) NULL ,
	Region nvarchar (15) NULL ,
	PostalCode nvarchar (10) NULL ,
	Country nvarchar (15) NULL ,
	Phone nvarchar (24) NULL ,
	Fax nvarchar (24) NULL ,
	CONSTRAINT PK_Customers PRIMARY KEY  CLUSTERED 
	(
		CustomerID
	)
);


CREATE TABLE Shippers (
	ShipperID int AUTO_INCREMENT NOT NULL ,
	CompanyName nvarchar (40) NOT NULL ,
	Phone nvarchar (24) NULL ,
	CONSTRAINT PK_Shippers PRIMARY KEY  CLUSTERED 
	(
		ShipperID
	)
);

CREATE TABLE Suppliers (
	SupplierID int AUTO_INCREMENT NOT NULL ,
	CompanyName nvarchar (40) NOT NULL ,
	ContactName nvarchar (30) NULL ,
	ContactTitle nvarchar (30) NULL ,
	Address nvarchar (60) NULL ,
	City nvarchar (15) NULL ,
	Region nvarchar (15) NULL ,
	PostalCode nvarchar (10) NULL ,
	Country nvarchar (15) NULL ,
	Phone nvarchar (24) NULL ,
	Fax nvarchar (24) NULL ,
	HomePage nvarchar (200) NULL ,
	CONSTRAINT PK_Suppliers PRIMARY KEY  CLUSTERED 
	(
		SupplierID
	)
);
 
CREATE TABLE Orders (
	OrderID int AUTO_INCREMENT NOT NULL PRIMARY KEY ,
	CustomerID nchar (5) NULL ,
	EmployeeID int NULL ,
	OrderDate datetime NULL ,
	RequiredDate datetime NULL ,
	ShippedDate datetime NULL ,
	ShipVia int NULL ,
	Freight decimal NULL,
	ShipName nvarchar (40) NULL ,
	ShipAddress nvarchar (60) NULL ,
	ShipCity nvarchar (15) NULL ,
	ShipRegion nvarchar (15) NULL ,
	ShipPostalCode nvarchar (10) NULL ,
	ShipCountry nvarchar (15) NULL 
);


CREATE TABLE Products (
	ProductID int AUTO_INCREMENT NOT NULL ,
	ProductName nvarchar (40) NOT NULL ,
	SupplierID int NULL ,
	CategoryID int NULL ,
	QuantityPerUnit nvarchar (20) NULL ,
	UnitPrice decimal NULL,
	UnitsInStock smallint NULL,
	UnitsOnOrder smallint NULL,
	ReorderLevel smallint NULL,
	Discontinued bit NOT NULL,
	CONSTRAINT PK_Products PRIMARY KEY  CLUSTERED 
	(
		ProductID
	),
	CONSTRAINT CK_Products_UnitPrice CHECK (UnitPrice >= 0),
	CONSTRAINT CK_ReorderLevel CHECK (ReorderLevel >= 0),
	CONSTRAINT CK_UnitsInStock CHECK (UnitsInStock >= 0),
	CONSTRAINT CK_UnitsOnOrder CHECK (UnitsOnOrder >= 0)
);


CREATE TABLE Order_Details(
	OrderID int NOT NULL ,
	ProductID int NOT NULL ,
	UnitPrice Decimal NOT NULL,
	Quantity smallint NOT NULL,
	Discount Decimal NOT NULL,
	CONSTRAINT PK_Order_Details PRIMARY KEY  CLUSTERED 
	(
		OrderID,
		ProductID
	),
	CONSTRAINT CK_Discount CHECK (Discount >= 0 and (Discount <= 1)),
	CONSTRAINT CK_Quantity CHECK (Quantity > 0),
	CONSTRAINT CK_UnitPrice CHECK (UnitPrice >= 0)
);


CREATE TABLE CustomerCustomerDemo(
	CustomerID nchar (5) NOT NULL Primary key,
	CustomerTypeID nchar (10) NOT NULL
);

CREATE TABLE CustomerDemographics (
	CustomerTypeID nchar (10) NOT NULL Primary key,
	CustomerDesc nvarchar (200) NULL 
);
	
CREATE TABLE Region ( 
	RegionID int NOT NULL Primary key,
	RegionDescription nchar (50) NOT NULL 
) ;

CREATE TABLE Territories 
	(TerritoryID nvarchar (20) NOT NULL ,
	TerritoryDescription nchar (50) NOT NULL ,
        RegionID int NOT NULL
) ;

CREATE TABLE EmployeeTerritories 
	(EmployeeID int NOT NULL Primary key,
	TerritoryID nvarchar (20) NOT NULL 
);

ALTER TABLE Products
ADD CONSTRAINT FK_Products
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);

ALTER TABLE [Order Details]
ADD CONSTRAINT FK_Order_det
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE Products
ADD CONSTRAINT FK_categoria
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

ALTER TABLE [Order Details]
ADD CONSTRAINT FK_order
FOREIGN KEY (OrderID) REFERENCES Oders(OrderID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Customer
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Shippers
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Employees
FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID);
