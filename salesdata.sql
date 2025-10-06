USE RetailDB;
GO

--DROP TABLE IF EXISTS dbo.OnlineRetail;
--GO
--EXEC sp_help 'OnlineRetail';

CREATE TABLE OnlineRetail_Stage(
	InvoiceNo	NVARCHAR(50),
	StockCode	NVARCHAR(50),
	Description	NVARCHAR(255),
	Quantity	NVARCHAR(50),
	InvoiceDate	NVARCHAR(50),
	UnitPrice	NVARCHAR(50),
	CustomerID	NVARCHAR(50),
	Country		NVARCHAR(100)
);
--SELECT * FROM OnlineRetail_Stage;

CREATE TABLE OnlineRetail (
	InvoiceNo	NVARCHAR(20)	NULL,
	StockCode	NVARCHAR(20)	NULL,
	Description	NVARCHAR(225)	NULL,
	Quantity	INT				NULL,
	InvoiceDate	DATETIME		NULL,
	UnitPrice	DECIMAL(10,2)	NULL,
	CustomerID	INT				NULL,
	Country		NVARCHAR(100)	NULL
);

INSERT INTO OnlineRetail
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
SELECT
	LTRIM(RTRIM(InvoiceNo))							AS InvoiceNo,
	LTRIM(RTRIM(StockCode))							AS StockCode,
	LTRIM(RTRIM(Description))						AS Description,
	TRY_CONVERT(INT,			NULLIF(LTRIM(RTRIM(Quantity))	, '')) AS Quantity,
	TRY_CONVERT(DATETIME,		NULLIF(LTRIM(RTRIM(InvoiceDate)), '')) AS InvoiceDate,
	TRY_CONVERT(DECIMAL(10,2),	NULLIF(LTRIM(RTRIM(UnitPrice))	, '')) AS UnitPrice,
	TRY_CONVERT(INT,			NULLIF(LTRIM(RTRIM(CustomerID))	, '')) AS CustomerID,
	LTRIM(RTRIM(Country))							AS Country
FROM OnlineRetail_Stage;

--SELECT InvoiceDate FROM OnlineRetail;

--SELECT COUNT(*) AS FinalRows FROM OnlineRetail;

--SELECT COUNT(*) AS FinalRows FROM OnlineRetail_Stage;

--SELECT TOP 20 *
--FROM OnlineRetail
--ORDER BY NEWID();

--SELECT Quantity
--FROM OnlineRetail_Stage
--WHERE NULLIF(LTRIM(RTRIM(Quantity)), '') IS NOT NULL
	--AND TRY_CONVERT(INT, LTRIM(RTRIM(Quantity))) IS NULL
--GROUP BY Quantity
--ORDER BY COUNT(*) DESC;

--TRUNCATE TABLE OnlineRetail;
