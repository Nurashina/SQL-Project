-- Exploring the data

SELECT *
  FROM Financials2
-- Finding if the column has spaces or not
SELECT
    Segment,
    Country,
    Product,
    Discount_Band,
    Units_Sold,
    Manufacturing_Price,
    Sale_Price,
    Gross_Sales,
    Discounts,
    Sales,
    COGS,
    Profit,
    Date,
    Month_Number,
    Month_Name,
    Year,
    CASE 
        WHEN LEN(Segment) != LEN(TRIM(Segment)) THEN 'Has Spaces' ELSE 'No Spaces' END AS segment_space_check,
    CASE 
        WHEN LEN(Country) != LEN(TRIM(Country)) THEN 'Has Spaces' ELSE 'No Spaces' END AS country_space_check,
    CASE 
        WHEN LEN(Product) != LEN(TRIM(Product)) THEN 'Has Spaces' ELSE 'No Spaces' END AS product_space_check,
    CASE 
        WHEN LEN(Discount_Band) != LEN(TRIM(Discount_Band)) THEN 'Has Spaces' ELSE 'No Spaces' END AS discount_band_space_check,
    CASE 
        WHEN LEN(Units_Sold) != LEN(TRIM(Units_Sold)) THEN 'Has Spaces' ELSE 'No Spaces' END AS units_sold_space_check,
    CASE 
        WHEN LEN(Manufacturing_Price) != LEN(TRIM(Manufacturing_Price)) THEN 'Has Spaces' ELSE 'No Spaces' END AS manufacturing_price_space_check,
    CASE 
        WHEN LEN(Sale_Price) != LEN(TRIM(Sale_Price)) THEN 'Has Spaces' ELSE 'No Spaces' END AS sale_price_space_check,
    CASE 
        WHEN LEN(Gross_Sales) != LEN(TRIM(Gross_Sales)) THEN 'Has Spaces' ELSE 'No Spaces' END AS gross_sales_space_check,
    CASE 
        WHEN LEN(Discounts) != LEN(TRIM(Discounts)) THEN 'Has Spaces' ELSE 'No Spaces' END AS discounts_space_check,
    CASE 
        WHEN LEN(Sales) != LEN(TRIM(Sales)) THEN 'Has Spaces' ELSE 'No Spaces' END AS sales_space_check,
    CASE 
        WHEN LEN(COGS) != LEN(TRIM(COGS)) THEN 'Has Spaces' ELSE 'No Spaces' END AS cogs_space_check,
    CASE 
        WHEN LEN(Profit) != LEN(TRIM(Profit)) THEN 'Has Spaces' ELSE 'No Spaces' END AS profit_space_check,
    CASE 
        WHEN LEN(Month_Name) != LEN(TRIM(Month_Name)) THEN 'Has Spaces' ELSE 'No Spaces' END AS month_name_space_check
FROM Financials2;

-- Remove extra spaces in units_sold, gross_sale, sales, cogs, profit, and discounts
UPDATE Financials2
SET 
Units_Sold =  TRIM(Units_Sold), 
Gross_Sales = TRIM(Gross_Sales), 
Sales = TRIM(Sales),
COGS = TRIM(COGS), 
Profit = TRIM(Profit), 
Discounts = TRIM(Discounts)

-- Remove $, -, , and () 
UPDATE Financials2
SET
Units_Sold = REPLACE(REPLACE(Units_Sold, '$', ''), ',', ''),
Manufacturing_Price = REPLACE(REPLACE(Manufacturing_Price, '$', ''), ',', ''),
Sale_Price = REPLACE(REPLACE(Sale_Price, '$', ''), ',', ''),
Gross_Sales = REPLACE(REPLACE(Gross_Sales, '$', ''), ',', '') ,
Discounts = CASE WHEN REPLACE(REPLACE(REPLACE(Discounts, '$', ''), '-', ''), ',', '') = '' THEN '0' 
ELSE REPLACE(REPLACE(REPLACE(Discounts, '$', ''), '-', ''), ',', '') END, -- replace blank cell with 0
Sales = REPLACE(REPLACE(Sales, '$', ''), ',', ''),
COGS = REPLACE(REPLACE(COGS, '$', ''), ',', ''),
Profit = REPLACE(REPLACE(REPLACE(REPLACE(Profit, '$', ''), ',', ''), '(', ''), ')', ''); 

SELECT*
FROM Financials2

UPDATE Financials2
SET
Units_Sold = CAST(Units_Sold AS money),
Manufacturing_Price = CAST(Manufacturing_Price AS money),
Sale_Price = CAST(Sale_Price AS money),
Gross_Sales = CAST(Gross_Sales AS money),
Discounts = CAST(Discounts AS money),
Sales = CAST(Sales AS money),
COGS = CAST(COGS AS money),
Profit = CAST(Profit AS money); -- the queries return are successfull, but no changes was made to the column itself, change query to ALTER the table and column

ALTER TABLE Financials2
ALTER COLUMN Units_Sold smallmoney;

ALTER TABLE Financials2
ALTER COLUMN Manufacturing_Price smallmoney;

ALTER TABLE Financials2
ALTER COLUMN Sale_Price smallmoney;

ALTER TABLE Financials2
ALTER COLUMN Gross_Sales money;

ALTER TABLE Financials2
ALTER COLUMN Discounts money;

ALTER TABLE Financials2
ALTER COLUMN Sales money;

ALTER TABLE Financials2
ALTER COLUMN COGS money;

ALTER TABLE Financials2
ALTER COLUMN Profit money;



