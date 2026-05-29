# /*

# QUERY 3: PRODUCT SALES PERFORMANCE ANALYSIS

#PURPOSE:
#This query analyzes product sales performance by displaying:

#* Product ID
#* Product Name
#* Category Name
#* Total Number of Orders
#* Total Quantity Sold
#* Average Unit Price

#The query demonstrates:

#* LEFT JOIN
#* INNER JOIN
#* Aggregate Functions
#* GROUP BY
#* ORDER BY
#* ISNULL handling

#BUSINESS VALUE:
#Helps the business identify top-selling products,
#monitor sales performance, analyze product demand,
#and track pricing trends across product categories.

#The LEFT JOIN ensures that products with no sales
#still appear in the results.


#*/

SELECT p.Product_id, p.Product_name, c.Category_name, COUNT(od.OrderID) 
AS TotalOrders, 
ISNULL(SUM(od.Quantity),0) AS TotalQuantitySold,  
ISNULL(AVG(od.Unit_price),0) AS AverageUnitPrice 
FROM Product p 
LEFT JOIN OrderDetails od ON p.Product_id = od.Product_id 
INNER JOIN Category c ON p.Category_ID = c.Category_ID 
GROUP BY p.Product_id, p.Product_name, c.Category_name 
ORDER BY TotalQuantitySold DESC; 
