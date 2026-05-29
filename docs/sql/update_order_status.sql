# /*

# STORED PROCEDURE: UPDATE ORDER STATUS

PURPOSE:
This stored procedure updates the status of an order
only if the specified order exists in the database.

The procedure demonstrates:

* Stored Procedures
* Parameters
* Conditional Logic
* IF EXISTS validation
* UPDATE statements

BUSINESS VALUE:
Helps automate order management by allowing order
statuses to be updated dynamically while preventing
invalid updates to non-existing orders.
=======================================

*/

CREATE PROCEDURE usp_UpdateOrderStatus
@OrderID INT,
@NewStatus VARCHAR(50)
AS
BEGIN
IF EXISTS (
    SELECT 1
    FROM Orders
    WHERE OrderID = @OrderID
)
BEGIN
    UPDATE Orders
    SET Order_status = @NewStatus
    WHERE OrderID = @OrderID;
    PRINT 'Order status updated successfully.';
END
ELSE
    PRINT 'Order not found.';
END;
-- Execute Stored Procedure
EXEC usp_UpdateOrderStatus
@OrderID = 2,
@NewStatus = 'Shipped';
-- View Updated Orders
SELECT *
FROM Orders;

