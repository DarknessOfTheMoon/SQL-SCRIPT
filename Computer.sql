CREATE DATABASE [ComputerProducts]
GO

USE [ComputerProducts]
GO

CREATE TABLE [Computer] (

	[ID]			INT IDENTITY (0, 1),
	[CPU]			NVARCHAR(MAX)				NOT NULL,
	[GPU]			NVARCHAR(MAX)				NOT NULL,
	[PowerSupply]	NVARCHAR(MAX)				NOT NULL,
	[RAM]			NVARCHAR(MAX)				NOT NULL,
	[Motherboard]	NVARCHAR(MAX)				NOT NULL,
	[Housing]		NVARCHAR(MAX)				NOT NULL,
	CONSTRAINT PK_Computer_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [CountryManufacture] (

	[CountryID]		NCHAR(3),
	[Title]			NVARCHAR(MAX)				NOT NULL,
	CONSTRAINT PK_CountryManufacture_CountryID PRIMARY KEY ([CountryID])
)
GO

INSERT INTO [CountryManufacture]([CountryID], [Title]) VALUES ('RUS', 'Russia')
INSERT INTO [CountryManufacture]([CountryID], [Title]) VALUES ('USA', 'United States')
INSERT INTO [CountryManufacture]([CountryID], [Title]) VALUES ('PRC', 'China')




CREATE TABLE [Product] (

	[ProductID]					INT IDENTITY (0, 1),
	[IDComputer]				INT	CONSTRAINT FK_Product_IDComputer_Computer_ID FOREIGN KEY REFERENCES [Computer]([ID])															NOT NULL,
	[IDCountryManufacture]		NCHAR(3)	CONSTRAINT FK_Product_IDCountryManufacture_CountryManufacture_CountryID FOREIGN KEY REFERENCES [CountryManufacture]([CountryID])		NOT NULL,
	CONSTRAINT PK_Product_ProductID PRIMARY KEY ([ProductID])

)
GO

CREATE TABLE [Role] (

	[RoleID]	NCHAR(1),
	[Title]		NVARCHAR(MAX)				NOT NULL,
	CONSTRAINT PK_Role_RoleID PRIMARY KEY ([RoleID])

)
GO

CREATE TABLE [SignIn] (

	[SignInID]		INT IDENTITY (0, 1),
	[Username]		NVARCHAR(MAX)				NOT NULL,
	[Password]		NVARCHAR(MAX)				NOT NULL,
	[IDRole]		NCHAR(1)	CONSTRAINT FK_SignIn_SignInID_Role_RoleID  FOREIGN KEY REFERENCES [Role]([RoleID])		NOT NULL,
	CONSTRAINT PK_SignIn_SigninID PRIMARY KEY ([SignInID])

)
GO

INSERT INTO [Role]([RoleID], [Title]) VALUES ('A','ADMIN')
INSERT INTO [Role]([RoleID], [Title]) VALUES ('U', 'USER')

INSERT INTO [SignIn]([Username], [Password], [IDRole]) VALUES ('none', '1234', 'A')
INSERT INTO [SignIn]([Username], [Password], [IDRole]) VALUES ('nonna', '1234', 'U')

SELECT * FROM SignIn