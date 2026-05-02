--Goal: Extract from 2017, 2018, 2019 tables and put into stagingTable

--Create the staging table
DROP TABLE IF EXISTS stagingTable;
CREATE TABLE stagingTable (
    yearInt INT(4),
    monthInt INT(2),
  	state CHAR(2),
  	country CHAR(3),
  	region VARCHAR(25),
  	customer_id INT(5),
  	Product_Name VARCHAR(25),
  	unitPrice INT(5),
  	quantityDiscount INT(5),
  	quantity INT(6),
  	orderTotal INT(6)
);



--Insert 2017 Data
INSERT INTO stagingTable(monthInt, state, country, region, Product_Name, unitPrice, quantity, orderTotal)
SELECT "month", "state", "country", "region", "product", "per_unit_price", "quantity", "order_total" 
FROM pd2017;

UPDATE stagingTable SET yearInt=2017;


--Insert 2018 Data
INSERT INTO stagingTable(monthInt, region, customer_id, Product_Name, unitPrice, quantity, orderTotal)
SELECT "month", "region", "customer_id", "product", "per_unit_price", "quantity_1" + "quantity_2", ("quantity_1" + "quantity_2") * "per_unit_price" 
FROM pd2018;

UPDATE stagingTable SET yearInt = 2018 WHERE yearInt ISNULL;

--Insert 2019 Data
INSERT INTO stagingTable(monthInt, country, region, state, Product_Name, unitPrice, quantity, orderTotal, quantityDiscount)
SELECT "month", "country", "region", "state", "product", "per_unit_price", "quantity", "order_subtotal" - "quantity_discoun", "quantity_discoun"
FROM pd2019;

UPDATE stagingTable SET yearInt = 2019 WHERE yearInt ISNULL;

SELECT * FROM stagingTable;

select sum(yearInt * monthInt * orderTotal)%2341 as checksum from stagingTable;

