IF NOT EXISTS ( SELECT * FROM sys.tables t join sys.schemas s on t.schema_id = s.schema_id
                where t.name = 'DimCustomer' and s.name = 'gold')
    CREATE EXTERNAL TABLE gold.DimCustomer
    WITH
    (
        LOCATION = 'DimCustomer',
        DATA_SOURCE = gold_source,
        FILE_FORMAT = parquet
    )
    AS
    SELECT *, ROW_NUMBER() OVER (ORDER by T.CustomerID) as DimCustomerKey
    FROM
    (
    SELECT
        DISTINCT
        CustomerID,
        CustomerName, 
        CustomerEmail,
        Domain
    FROM
        silver.silverTable
    ) T 

----------------------------------
-- Product----------------------------
-----------------------------------------

IF NOT EXISTS ( SELECT * FROM sys.tables t join sys.schemas s on t.schema_id = s.schema_id
                where t.name = 'DimProduct' and s.name = 'gold')
    CREATE EXTERNAL TABLE gold.DimProduct
    WITH
    (
        LOCATION = 'DimProduct',
        DATA_SOURCE = gold_source,
        FILE_FORMAT = parquet
    )
    AS
    SELECT *, ROW_NUMBER() OVER (ORDER by T.ProductID) as DimProductKey
    FROM
    (
    SELECT
        DISTINCT
        ProductID,
        ProductName, 
        ProductCategory
    from
        silver.silverTable
    ) T

--------------------------------------
----geography-----------------------
---------------------------------------------

IF NOT EXISTS ( SELECT * FROM sys.tables t join sys.schemas s on t.schema_id = s.schema_id
                where t.name = 'DimGeo' and s.name = 'gold')
    CREATE EXTERNAL TABLE gold.DimGeo
    WITH
    (
        LOCATION = 'DimGeo',
        DATA_SOURCE = gold_source,
        FILE_FORMAT = parquet
    )
    AS
    SELECT *, ROW_NUMBER() OVER (ORDER by T.RegionID) as DimGeoKey
    FROM
    (
    SELECT
        DISTINCT
        RegionID,
        Country
    from
        silver.silverTable
    ) as T

----------------------------------------
-----Order---------------------------------------
-------------------------------------

IF NOT EXISTS ( SELECT * FROM sys.tables t join sys.schemas s on t.schema_id = s.schema_id
                where t.name = 'DimOrders' and s.name = 'gold')
    CREATE EXTERNAL TABLE gold.DimOrders
    WITH
    (
        LOCATION = 'DimOrders',
        DATA_SOURCE = gold_source,
        FILE_FORMAT = parquet
    )
    AS
    SELECT
        OrderID, 
        CustomerID,
        CustomerName, 
        CustomerEmail,
        ProductID, 
        ProductName, 
        ProductCategory, 
        RegionID,
        Country,
        Domain,
        ROW_NUMBER() OVER (ORDER by CustomerID) as DimOrderKey
    from
        silver.silverTable


