USE Northwind


/*
****************************************************
	Inserción Masiva de datos
****************************************************
*/
DECLARE @i int
SET @i = 1
-- Employees
BEGIN TRANSACTION
	WHILE @i <= 500000 
	BEGIN
	INSERT INTO Employees(LastName,FirstName,Title,TitleOfCourtesy, BirthDate, HireDate, Address, City, 
	Region, PostalCode, Country, HomePhone, Extension, Notes, ReportsTo) VALUES 
	('Apellido' + CONVERT(varchar(40), @i), 'Nombre' +CONVERT(varchar(12), @i),
	'Title' + CONVERT(varchar(30), @i), 'TitleOfCourtesy' +CONVERT(varchar(25), @i), 
	'2000-22-02', '2006-22-02', 'Address' +CONVERT(varchar(25), @i), 'City' +CONVERT(varchar(25), @i) 
	, 'Region' +CONVERT(varchar(25), @i) , '2322' , 'Country' +CONVERT(varchar(25), @i)
	 , '0938387374' , '101', 'Notes' +CONVERT(varchar(25), @i),CONVERT(int, @i));
	SET @i=@i+1
	END
COMMIT TRANSACTION


--Supliers
SET @i = 1
BEGIN TRANSACTION
	WHILE @i <= 500000
	BEGIN
	INSERT INTO Suppliers(CompanyName, ContactName, ContactTitle, Address, 
	 City, Region, PostalCode, Country, Phone, Fax, HomePage) VALUES 
	('CompanyName', + CONVERT(varchar(40), @i), 'ContactName', +CONVERT(varchar(12), @i),
	'ContactTitle' + CONVERT(varchar(30), @i), 'Address' +CONVERT(varchar(25), @i),
	'ciudad' +CONVERT(varchar(25), @i), 'region' +CONVERT(varchar(25), @i),  'pais' +CONVERT(varchar(25), @i),
	'0932382321', '1232323232', 'HomePage' +CONVERT(varchar(25), @i));
	SET @i=@i+1
	END
COMMIT TRANSACTION




Insert into Categories (CategoryName, Description) values ('Categoria1', 'Descripcion1')


--Products
SET @i = 1
BEGIN TRANSACTION
	WHILE @i <= 500000
	BEGIN
	INSERT INTO Products(ProductName, SupliersID, CategoryID, QuantityPerUnit, 
	 UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES 
	('Producto', + CONVERT(varchar(40), @i), 1, 1, '20', 20, 10,  2, 1, 0);
	SET @i=@i+1
	END
COMMIT TRANSACTION


--Customers
SET @i = 1
BEGIN TRANSACTION
	WHILE @i <= 500000
	BEGIN
	INSERT INTO Customers(CompanyName, ContactName, ContactTitle, Address, 
	 City, Region, PostalCode, Country, Phone, Fax) VALUES 
	('CompanyName', + CONVERT(varchar(40), @i), 'ContactName', +CONVERT(varchar(12), @i),
	'ContactTitle' + CONVERT(varchar(30), @i), 'Address',
	'ciudad', 'region' +CONVERT(varchar(25), @i), '2178' ,'pais',
	'0932382322', '1232323233');
	SET @i=@i+1
	END
COMMIT TRANSACTION


/*
****************************************************
	Actualización Masiva de datos
****************************************************
*/
-- Employees
SET @i = 1
-- Employees
BEGIN TRANSACTION
	WHILE @i <= 250000 
	BEGIN
	UPDATE Employees set LastName = 'ApellidoNuevo',FirstName ='NombreNuevo' ,Title ='titulo',TitleOfCourtesy = 'titulo'
	, BirthDate = '2000-22-05', HireDate = '2009-22-05', Address = 'address', City = 'city', 
	Region = 'region', PostalCode = '2211', Country='pais', HomePhone='0389289823', Extension ='101', Notes='notes',
	ReportsTo = 1 where EmployeeID = @i
	SET @i=@i+1
	END
COMMIT TRANSACTION

--Supliers
SET @i = 1

BEGIN TRANSACTION
	WHILE @i <= 250000
	BEGIN
	UPDATE Suppliers SET CompanyName ='Compania', ContactName='Nombre', ContactTitle='titulo', Address='address', 
	 City='Ciudad', Region = 'region', PostalCode = '2211', Country='pais', Phone='0989289823',
	 Fax='0389289823', HomePage='www.ejemplo.com' where SupplierID = @i
	SET @i=@i+1
	END
COMMIT TRANSACTION

--Products
SET @i = 1
BEGIN TRANSACTION
	WHILE @i <= 250000
	BEGIN
	UPDATE Products SET ProductName = 'producto', QuantityPerUnit='30', 
	 UnitPrice = 20, UnitsInStock = 100, UnitsOnOrder = 11, ReorderLevel = 1, Discontinued = 0 where ProductID = @i
	SET @i=@i+1
	END
COMMIT TRANSACTION

--Customers
SET @i = 1
BEGIN TRANSACTION
	WHILE @i <= 250000
	BEGIN
	UPDATE Customers SET CompanyName = 'compania', ContactName = 'Contacto', ContactTitle = 'titulo', 
	Address = 'ubicación', City = 'city', Region = 'region', PostalCode = '2211', Country='pais', 
	Phone = '0921392313', Fax= '2321321323' where CustomerID = @i
	SET @i=@i+1
	END
COMMIT TRANSACTION

/*
****************************************************
	Muestra Masiva de datos
****************************************************
*/

Select * from Categories, Customers, Employees, [Order Details], Orders, Products, Shippers, Suppliers


/*
****************************************************
	Muestra Masiva de datos
****************************************************
*/
Drop database Northwind