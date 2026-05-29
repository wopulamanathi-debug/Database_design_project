/*PURPOSE:
This query identifies customers whose order totals are
greater than the average order amount across all orders
in the database.

The query demonstrates:

INNER JOIN
Aggregate functions
Subqueries
CONCAT
Filtering with WHERE
Sorting using ORDER BY

*/


SELECT c.Cust_ID, CONCAT(c.first_name,'',c.last_name), o.OrderID, 
o.Total_amount 
FROM Customer c 
INNER JOIN Orders o 
ON c.Cust_ID = o.Cust_ID 
WHERE o.Total_amount > 
( 
SELECT AVG(Total_amount) 
FROM Orders 
) 
ORDER BY o.Total_amount DESC;
