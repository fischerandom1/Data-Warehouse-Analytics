USE [BikeSalesGroup2]
GO

/* CSV Files */
-- Customer
BULK INSERT sales.customers
FROM 'C:\Halp\DENG\CA2\data\customers.csv'
WITH (fieldterminator=',', rowterminator='\n', firstrow=2)

-- Order Items
BULK INSERT sales.order_items
FROM 'C:\Halp\DENG\CA2\data\OrderItems.csv'
WITH (fieldterminator=',', rowterminator='\n', firstrow=2)

-- Orders
SET DATEFORMAT DMY;
BULK INSERT sales.orders
FROM 'C:\Halp\DENG\CA2\data\Orders.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',
	KEEPNULLS,--Use to shift the control to next row
    TABLOCK);

-- Stocks
BULK INSERT production.stocks
FROM 'C:\Halp\DENG\CA2\data\Stocks.csv'
WITH (fieldterminator=',', rowterminator='\n', firstrow=2)

/* TXT Files */
-- Brand
BULK INSERT production.brands
FROM 'C:\Halp\DENG\CA2\data\brand.txt'
WITH (fieldterminator='\t', rowterminator='\n', firstrow=2)

-- Categories
BULK INSERT production.categories
FROM 'C:\Halp\DENG\CA2\data\category.txt'
WITH (fieldterminator='\t', rowterminator='\n', firstrow=2)

-- Staffs
BULK INSERT sales.staffs
FROM 'C:\Halp\DENG\CA2\data\staff.txt'
WITH (fieldterminator='\t', rowterminator='\n', firstrow=2)

-- Stores
BULK INSERT sales.stores
FROM 'C:\Halp\DENG\CA2\data\store.txt'
WITH (fieldterminator='\t', rowterminator='\n', firstrow=2)

/* JSON Files */
-- Products
DECLARE @products Varchar(max) 
 
SELECT @products =  
 	BulkColumn 
 	 	FROM OPENROWSET(BULK 'C:\Halp\DENG\CA2\data\products.json', SINGLE_BLOB) JSON  
INSERT INTO production.products 
  SELECT * FROM OpenJSON(@products, '$') 
 	WITH ( 
 	product_id Varchar(10) '$.product_id', 
 	product_name Varchar(255) '$.product_name', 
 	brand_id Varchar(5) '$.brand_id', 
 	category_id Varchar(5) '$.category_id', 
 	model_year Int '$.model_year', 
 	list_price DECIMAL (10, 2) '$.list_price'
 	)