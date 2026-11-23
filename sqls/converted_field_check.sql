select count(*) as "Total Rows" from dbo.RetailCombined;

select count(*) as "Missed Dates" from dbo.RetailCombined where InvoiceDate IS NULL;
select count(*) as "Missed Price" from dbo.RetailCombined where Price IS NULL;