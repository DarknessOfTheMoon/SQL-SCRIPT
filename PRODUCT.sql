CREATE DATABASE [Product]

USE [Product]

CREATE TABLE [Phone] (

	[ID]				INT IDENTITY (0, 1),
	[Manufacturer]		NVARCHAR(50)			NOT NULL,
	[Model]				NVARCHAR(50)			NOT NULL,
	[SerialNumber]		INT						NOT NULL,
	[IDÑountryM]		NCHAR(1)	CONSTRAINT	FK_Phone_IDÑountryM_CountryManufacturer_IDCountry	FOREIGN KEY REFERENCES [CountryManufacturer]([IDCountry])	NOT NULL,
	CONSTRAINT PK_Phone_ID PRIMARY KEY ([ID]),
)	

CREATE TABLE [CountryManufacturer] (

	[IDCountry]			NCHAR(1),
	[CountryName]		NVARCHAR(50)			NOT NULL,
	CONSTRAINT PK_CountryManufacturer_ID PRIMARY KEY ([IDCountry])
)