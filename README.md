# Sales Data Pipeline & Power BI Dashboard

### 📊 Overview
This project demonstrates an end-to-end sales analytics workflow — from raw CSV data to an interactive Power BI dashboard — using **SQL Server**, **SSIS (Visual Studio)**, and **Power BI (DAX)**.  
The goal was to build a data pipeline that ingests raw sales transactions, transforms them into a structured model, and delivers meaningful business insights.

---

### 🗂️ Data Source
- **Dataset:** [Kaggle – Online Retail Dataset](https://www.kaggle.com/)  
- **File:** `OnlineRetail.csv`  
- **Description:** Contains real retail transactions including Invoice No, Stock Code, Description, Quantity, Unit Price, Customer ID, and Country.

---

### 🔧 ETL Process (SSIS / Visual Studio)
- **Extract:** Imported the Kaggle CSV using SSIS Flat File Source.  
- **Transform:** Cleaned data types (numeric, text, dates) and handled nulls with the **Data Conversion** task.  
- **Load:** Inserted the transformed data into **SQL Server** table `CustomerRevenue`.

*Example Screenshot:*  
![ETL Package](screenshot_SSIS_ETL.png)

---

### 🗄️ SQL Server Stage
All SQL logic is contained in `SalesDataPipeline.sql`, which:
- Creates and defines the `CustomerRevenue` table schema.  
- Loads data from the SSIS import.  
- Includes commented sanity-check queries (row counts, distinct IDs, revenue totals).  

Example:
```sql
-- Verify data loaded
-- SELECT COUNT(*) FROM CustomerRevenue;

-- Total revenue by country
SELECT Country, SUM(TotalRevenue) AS TotalRevenue
FROM CustomerRevenue
GROUP BY Country
ORDER BY TotalRevenue DESC;
