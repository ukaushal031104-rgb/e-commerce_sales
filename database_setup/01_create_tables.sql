-- 1. Create region table
CREATE TABLE IF NOT EXISTS region (
    RegionID VARCHAR(50) PRIMARY KEY,
    RegionName VARCHAR(100),
    Country VARCHAR(50) DEFAULT 'Brazil'
);

-- 2. Create customers table
CREATE TABLE IF NOT EXISTS customers (
    CustomerId VARCHAR(50) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(50),
    Region VARCHAR(50),
    CreateDate DATETIME,
    FOREIGN KEY (Region) REFERENCES region(RegionID)
);

-- 3. Create products table
CREATE TABLE IF NOT EXISTS products (
    ProductId VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(200),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);

-- 4. Create orders table
CREATE TABLE IF NOT EXISTS orders (
    OrderId VARCHAR(50) PRIMARY KEY,
    CustomerId VARCHAR(50),
    OrderDate DATETIME,
    IsReturned BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (CustomerId) REFERENCES customers(CustomerId)
);

-- 5. Create orderdetails table
CREATE TABLE IF NOT EXISTS orderdetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderId VARCHAR(50),
    ProductId VARCHAR(50),
    Quantity INT DEFAULT 1,
    FOREIGN KEY (OrderId) REFERENCES orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES products(ProductId)
);
