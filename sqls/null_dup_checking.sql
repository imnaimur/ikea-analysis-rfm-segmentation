SELECT COUNT(*) AS Missing_IDs FROM dbo.RetailCombined WHERE Customer_ID is Null;
SELECT COUNT(*) AS Invalid_Qty FROM dbo.RetailCombined WHERE Quantity <= 0;

SELECT
	Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID,Country,
	COUNT(*) as ExactDuplicate
	from dbo.RetailCombined
	group by Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID,Country
	HAVING COUNT(*)>1;