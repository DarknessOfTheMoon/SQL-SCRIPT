CREATE DATABASE [BOOK] 
GO

USE [BOOK]
GO

CREATE TABLE [BOOKS] (

	[ID]				INT IDENTITY (0, 1),
	[NAME]				NVARCHAR(MAX)			NOT NULL,
	[NUMBEROFPAGES]		NVARCHAR(MAX)			NOT NULL,
	[IDGENRE]			NCHAR(1)	CONSTRAINT FK_BOOKS_IDGENRE_GENRE_IDGENREPK FOREIGN KEY REFERENCES [GENRE] ([IDGENREPK])						NOT NULL,
	[IDAUTHOR]			NCHAR(1)	CONSTRAINT FK_BOOKS_IDAUTHOR_AUTHOR_IDAUTHORPK FOREIGN KEY REFERENCES [AUTHOR] ([IDAUTHORPK])					NOT NULL,
	[IDPUBLISHER]		NCHAR(1)	CONSTRAINT FK_BOOKS_IDAPUBLISHER_PUBLISHER_IDPUBLISHERPK FOREIGN KEY REFERENCES [PUBLISHER] ([IDPUBLISHERPK])	NOT NULL,
	CONSTRAINT PK_BOOKS_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [GENRE] (
		
	[IDGENREPK]			INT IDENTITY(0, 1),
	[NAME]				NVARCHAR(MAX)			NOT NULL,
	CONSTRAINT PK_GENRE_IDGENREPK PRIMARY KEY ([IDGENREPK])

)
GO

CREATE TABLE [AUTHOR] (

	[IDAUTHORPK]		INT IDENTITY(0, 1),
	[SURNAME]			NVARCHAR(MAX)			NOT NULL,
	[NAME]				NVARCHAR(MAX)			NOT NULL,
	[PATRONYMIC]		NVARCHAR(MAX)			NOT NULL,
	[YEAROFBIRTH]		DATE					NOT NULL,
	CONSTRAINT PK_AUTHOR_IDAUTHORPK PRIMARY KEY ([IDAUTHORPK])

)
GO

CREATE TABLE [PUBLISHER] (
	
	[IDPUBLISHERPK]		INT IDENTITY(0, 1),
	[NAME]				NVARCHAR(MAX)			NOT NULL,
	[ADDRESS]			NVARCHAR(MAX)			NOT NULL,
	[IDCOUNTRY]			NCHAR(3)	CONSTRAINT FK_PUBLISHER_IDPUBLISHERPK_COUNTRY_IDCOUNTRYPK FOREIGN KEY REFERENCES [COUNTRY] ([IDCOUNTRYPK])	NOT NULL,
	CONSTRAINT PK_PUBLISHER_IDPUBLISHERPK PRIMARY KEY ([IDPUBLISHERPK])
)
GO

CREATE TABLE [COUNTRY] (

	[IDCOUNTRYPK]		NCHAR(3),
	[NAME]				NVARCHAR(MAX)			NOT NULL,
	CONSTRAINT PK_COUNTRY_IDCOUNTRYPK PRIMARY KEY ([IDCOUNTRYPK])
)
GO