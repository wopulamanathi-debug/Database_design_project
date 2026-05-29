# /*

# VIEW: INVENTORY STATUS CLASSIFICATION

PURPOSE:
This SQL VIEW classifies inventory stock levels into
different categories based on quantity available.

The view demonstrates:

* SQL Views
* CASE Statements
* INNER JOIN operations
* Inventory reporting logic

STOCK CLASSIFICATIONS:

* Out of Stock  -> Quantity = 0
* Low           -> Quantity between 1 and 10
* Medium        -> Quantity between 11 and 50
* High          -> Quantity above 50

BUSINESS VALUE:
Helps the business monitor inventory levels efficiently,
identify low-stock products, and improve stock management
and replenishment decisions.
*/

CREATE VIEW vw_InventoryStatus AS

SELECT
P.Product_name,
S.QuantityAvailable,
W.WarehouseName,

```
CASE

    WHEN S.QuantityAvailable = 0
        THEN 'Out of Stock'

    WHEN S.QuantityAvailable <= 10
        THEN 'Low'

    WHEN S.QuantityAvailable <= 50
        THEN 'Medium'

    ELSE 'High'

END AS Stock_Level
```

FROM Stock S

INNER JOIN Product P
ON S.Product_id = P.Product_id

INNER JOIN Warehouse W
ON S.Warehouse_id = W.Warehouse_id;

-- View Inventory Status
SELECT *
FROM vw_InventoryStatus;
