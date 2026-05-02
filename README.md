# Candy Sales Data Mart ETL Project
- Designed and implemented a SQL-based ETL pipeline to consolidate three years of legacy sales datasets (2017–2019) into a unified staging table for analytics and reporting.
- Transformed inconsistent source schemas by recalculating metrics, merging split shipment quantities, applying discount logic, and standardizing product and order fields.
- Performed data quality validation through checksum testing, query debugging, and record-level verification while building a reusable structure for future BI reporting and trend analysis.

Description: This project implements a SQL-based ETL pipeline to consolidate three years of sales data (2017–2019) into a unified staging table for analysis. Source datasets had inconsistent schemas, requiring transformation logic to standardize fields. For 2018, split shipment quantities were combined and used to recalculate order totals. For 2019, discount values were applied by subtracting quantity discounts from order subtotals. The final dataset was validated using checksum testing and query-based verification to ensure accuracy and consistency for downstream analytics.
