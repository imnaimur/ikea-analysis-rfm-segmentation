WITH deduplicate AS(
	SELECT 
	*,
		ROW_NUMBER() OVER(
			PARTITION BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID,Country
			ORDER BY (SELECT NULL)
		) AS RowNum
	FROM dbo.RetailCombined
)
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID,Country, SourceSheet
INTO RetailCleaned
FROM deduplicate
WHERE RowNum = 1;