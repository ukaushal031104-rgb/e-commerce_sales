# 🛒 E-Commerce Sales Analysis Using MySQL (Olist Dataset)

![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Data Analysis](https://img.shields.io/badge/Data_Analysis-blue?style=for-the-badge&logo=google-analytics&logoColor=white)
![Business Intelligence](https://img.shields.io/badge/Business_Intelligence-orange?style=for-the-badge)

## 📌 Project Overview
This project presents a comprehensive, relational e-commerce database designed entirely in MySQL. Its primary purpose is to facilitate detailed, business-driven sales analysis using structured SQL queries. 

The project utilizes the real-world **[Brazilian E-Commerce Public Dataset by Olist (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)**. To make the raw data easier to analyze, a custom Python script is included that transforms the massive Kaggle dataset into a clean, normalized 5-table relational schema.

---

## 🎯 Project Goal
To analyze the sales performance of products, categories, and regions, providing actionable insights that support data-driven business decision-making and strategic growth.

---

## 🧱 Database Design

The database architecture consists of **5 relational tables**, designed to accurately mirror real-world e-commerce operations. Relationships are enforced using primary and foreign keys to ensure data integrity.

| Table Name | Description & Key Columns |
| :--- | :--- |
| **`customers`** | Stores customer profiles and location data. <br>*(CustomerId, CustomerName, Email, Phone, Region, CreateDate)* |
| **`orders`** | Tracks order history and return status. <br>*(OrderId, CustomerId, OrderDate, IsReturned)* |
| **`orderdetails`** | Granular data connecting orders to specific products. <br>*(OrderDetailID, OrderId, ProductId, Quantity)* |
| **`products`** | Product catalog with pricing and categories. <br>*(ProductId, ProductName, Category, Price)* |
| **`region`** | Geographical metadata for regional analysis. <br>*(RegionID, RegionName, Country)* |

### ER Diagram

![Database ER Diagram](screenshots/er_dig.png)

---

## 🛠 Tools & Technologies
- **Relational Database:** MySQL
- **Data Transformation:** Python (Pandas)
- **Query Language:** SQL
- **Concepts:** Relational Database Design, ER Modeling, Data Aggregation, Business Intelligence

---

## 🔍 Analysis Objectives & Business Questions

The SQL queries in this project are designed to extract insights across six key business areas:

### 1. General Sales Insights
- Total historical revenue generated.
- Net revenue (excluding returned orders).
- Revenue trends broken down by year, month, product, and category.
- Average Order Value (AOV) overall, and tracked across time.
- Average order size analyzed by region.

### 2. Customer Insights
- **Top Performers:** Identify the top 10 customers by total revenue.
- **Retention:** Calculate the repeat customer rate and the average time between consecutive orders by region.
- **Segmentation:** Classify customers based on their total spend (Platinum, Gold, Silver, Bronze).

### 3. Product & Order Insights
- Top 10 products ranked by quantity sold and total revenue.
- Identify products and categories with the highest return rates.
- Track sales trends across various product categories.

---

## ▶️ How to Run the Project

To replicate the database and run the analysis locally, follow these steps:

1. **Get the Data:**
   Follow the instructions in `dataset/README_DATASET.md` to download the Olist data from Kaggle and run `transform_olist.py` to generate the CSVs.
2. **Setup the Database:**
   Execute the SQL scripts in the `database_setup/` folder in this sequence:
   - Run `01_create_tables.sql` to create tables.
   - Run `02_load_data.sql` to import the generated CSVs using `LOAD DATA INFILE`.
3. **Run the Analysis:**
   Once the database is populated, execute `analysis_queries/analysis_queries.sql` to perform the business analysis.
4. **Verify Results:**
   Check the `screenshots/query_results/` folder for visual verifications of query outputs.

---

## 📸 Query Results Gallery
*(Here you can paste screenshots of your most impressive SQL query results running in MySQL Workbench or DBeaver)*

**1. Top 10 Customers by Revenue**  
![Top 10 Customers](screenshots/query_results/top_customers_placeholder.png)

**2. Regional Revenue Comparison**  
![Regional Revenue](screenshots/query_results/regional_revenue_placeholder.png)

---

## 📂 Repository Structure

```text
📁 e-commerce-sales-analysis/
├── 📁 dataset/              # Python script and instructions for downloading Olist data
├── 📁 database_setup/       # SQL scripts for tables, data insertion, & constraints
├── 📁 analysis_queries/     # SQL files containing business analysis queries
├── 📁 screenshots/          
│   ├── 📁 ER_Diagram/       # Database schema visualizations
│   └── 📁 query_results/    # Output screenshots of SQL queries
├── 📁 project_objective/    # Business problem statement & objectives documentation
└── 📝 README.md             # Project documentation (You are here)
```

---

## ✅ Skills Demonstrated
- Relational database architecture & design.
- Python data transformation (Pandas).
- Entity-Relationship (ER) diagram modeling.
- Database population via SQL `LOAD DATA INFILE`.
- Advanced SQL writing (Joins, aggregations, filtering, grouping, subqueries).
- Business-focused data analysis & insight generation.
