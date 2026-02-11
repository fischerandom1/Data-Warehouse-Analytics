USE [BikeSalesDWGroup2]
GO

CREATE TABLE StaffDim (
  StaffKey INT NOT NULL IDENTITY,
  StaffId VARCHAR(25) NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Phone VARCHAR(255) NOT NULL,
  Active INT NOT NULL,
  ManagerID VARCHAR(25) NULL,
  PRIMARY KEY (StaffKey)
);

-- Language: sql

-- create storeDimenion table
CREATE TABLE StoreDim (
  StoreKey INT NOT NULL IDENTITY,
  StoreID VARCHAR(25) NOT NULL,
  StoreName VARCHAR(255) NOT NULL,
  Phone VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Street VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  State VARCHAR(255) NOT NULL,
  ZipCode VARCHAR(255) NOT NULL,
  PRIMARY KEY (StoreKey)
);


-- create customerDimension table
CREATE TABLE CustomerDim (
  CustomerKey INT NOT NULL IDENTITY,
  CustomerID VARCHAR(25) NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Phone VARCHAR(255) NULL,
  Street VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  State VARCHAR(255) NOT NULL,
  ZipCode VARCHAR(255) NOT NULL,
  PRIMARY KEY (CustomerKey)
);

-- ProductDimension table
CREATE TABLE ProductDim (
  ProductKey INT NOT NULL IDENTITY,
  ProductID VARCHAR(25) NOT NULL, 
  ProductName VARCHAR(255) NOT NULL,
  BrandName VARCHAR(255) NOT NULL,
  CategoryName VARCHAR(255) NOT NULL,
  ModelYear INT NOT NULL,
  StockDate DATE NOT NULL,
  StockQuantity INT NOT NULL,
  PRIMARY KEY (ProductKey)
);

-- orderDimension table
CREATE TABLE OrderDim (
  OrderKey INT NOT NULL IDENTITY,
  OrderID VARCHAR(25) NOT NULL,
  OrderDate DATE NOT NULL,
  OrderStatus INT NOT NULL,
  RequiredDate DATE NOT NULL,
  ShippedDate DATE NULL,
  PRIMARY KEY (OrderKey)
);

-- timeDimension table
CREATE TABLE	TimeDim
	(	[TimeKey] INT primary key, 
		[Date] DATETIME,
		[FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
		[FullDateUSA] CHAR(10),-- Date in MM-dd-yyyy format
		[DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
		[DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
		[DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
		[DayOfWeekUSA] CHAR(1),-- First Day Sunday=1 and Saturday=7
		[DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
		[DayOfYear] VARCHAR(3),
		[WeekOfMonth] VARCHAR(1),-- Week Number of Month 
		[WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
		[WeekOfYear] VARCHAR(2),--Week Number of the Year
		[Month] VARCHAR(2), --Number of the Month 1 to 12
		[MonthName] VARCHAR(9),--January, February etc
		[MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
		[Quarter] CHAR(1),
		[QuarterName] VARCHAR(9),--First,Second..
		[Year] CHAR(4),-- Year value of Date stored in Row
		[YearName] CHAR(7), --CY 2012,CY 2013
		[MonthYear] CHAR(10), --Jan-2013,Feb-2013
		[MMYYYY] CHAR(6),
		[FirstDayOfMonth] DATE,
		[LastDayOfMonth] DATE,
		[FirstDayOfQuarter] DATE,
		[LastDayOfQuarter] DATE,
		[FirstDayOfYear] DATE,
		[LastDayOfYear] DATE,
		[IsHolidayUSA] BIT,-- Flag 1=National Holiday, 0-No National Holiday
		[IsWeekday] BIT,-- 0=Week End ,1=Week Day
		[HolidayUSA] VARCHAR(50),--Name of Holiday in US
		[IsHolidayUK] BIT Null,
		[HolidayUK] VARCHAR(50) Null --Name of Holiday in UK
);

-- create the fact table
CREATE TABLE SalesFacts (
  StaffKey INT NOT NULL,
  StoreKey INT NOT NULL,
  CustomerKey INT NOT NULL,
  ProductKey INT NOT NULL,
  OrderKey INT NOT NULL,
  TimeKey INT NOT NULL,
  ListPrice DECIMAL(10,2) NOT NULL,
  Quantity DECIMAL(10,2) NOT NULL,
  Discount DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (StaffKey, StoreKey, CustomerKey, ProductKey, OrderKey, TimeKey),
  FOREIGN KEY (StaffKey) REFERENCES StaffDim(StaffKey),
  FOREIGN KEY (StoreKey) REFERENCES StoreDim(StoreKey),
  FOREIGN KEY (CustomerKey) REFERENCES CustomerDim(CustomerKey),
  FOREIGN KEY (ProductKey) REFERENCES ProductDim(ProductKey),
  FOREIGN KEY (OrderKey) REFERENCES OrderDim(OrderKey),
  FOREIGN KEY (TimeKey) REFERENCES TimeDim(TimeKey)
);