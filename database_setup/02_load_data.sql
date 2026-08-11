-- 1. Load region table
LOAD DATA INFILE '/path/to/dataset/transformed_region.csv'
INTO TABLE region
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(RegionID, RegionName, Country);

-- 2. Load customers table
LOAD DATA INFILE '/path/to/dataset/transformed_customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerId, CustomerName, Email, Phone, Region, CreateDate);

-- 3. Load products table
LOAD DATA INFILE '/path/to/dataset/transformed_products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ProductId, ProductName, Category, Price);

-- 4. Load orders table
LOAD DATA INFILE '/path/to/dataset/transformed_orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(OrderId, CustomerId, OrderDate, IsReturned);

-- 5. Load orderdetails table
LOAD DATA INFILE '/path/to/dataset/transformed_orderdetails.csv'
INTO TABLE orderdetails
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(OrderId, ProductId, Quantity);
