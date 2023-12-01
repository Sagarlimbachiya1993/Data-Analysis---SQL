---Inserting Bulk Data

GO
 
-- import the file--brands.csv
BULK INSERT dbo.brands
FROM 'C:\Users\USER\Dropbox\PC\Desktop\sql project\bikestore_Inventory_Management\brands.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=1
)
GO

-- import the file--product_categories.csv
BULK INSERT dbo.categories
FROM 'C:\Users\USER\Dropbox\PC\Desktop\sql project\bikestore_Inventory_Management\product_categories.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=1
)
GO

-- import the file--sales_customers.csv
BULK INSERT dbo.customers
FROM 'C:\Users\USER\Dropbox\PC\Desktop\sql project\bikestore_Inventory_Management\sales_customers.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=1
)
GO

-- import the file--sales_orders_items.csv
BULK INSERT dbo.order_items
FROM 'C:\Users\USER\Dropbox\PC\Desktop\sql project\bikestore_Inventory_Management\sales_orders_items.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=1
)
GO

-- import the file--sales_orders.csv
BULK INSERT dbo.orders
FROM 'C:\Users\USER\Dropbox\PC\Desktop\sql project\bikestore_Inventory_Management\sales_orders.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=1
)
GO

-- import the file--products.csv
BULK INSERT dbo.products
FROM 'C:\Users\USER\Dropbox\PC\Desktop\sql project\bikestore_Inventory_Management\products.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=1
)
GO

-- import the file--sales_stores.csv
BULK INSERT dbo.stores
FROM 'C:\Users\USER\Dropbox\PC\Desktop\sql project\bikestore_Inventory_Management\sales_stores.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=1
)
GO

