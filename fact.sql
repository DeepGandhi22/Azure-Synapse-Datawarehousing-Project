IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s on t.schema_id = s.schema_id
                where t.name = 'factOrders' and s.name = 'gold')
        CREATE EXTERNAL TABLE gold.factOrders
        WITH
        (
            LOCATION = 'factOrders',
            DATA_SOURCE = gold_source,
            FILE_FORMAT = parquet
        )
        AS
        SELECT
            O.DimOrderKey,
            C.DimCustomerKey, 
            P.DimProductKey,
            G.DimGeoKey,
            F.UnitPrice, 
            F.Quantity,
            F.TotalAmount
        FROM
            silver.silverTable F
        LEFT JOIN 
            gold.DimOrders O on F.OrderID = O.OrderID
        LEFT JOIN
            gold.DimCustomer C on F.CustomerID = C.CustomerID
        LEFT JOIN
            gold.DimProduct P on F.ProductID = P.ProductID
        LEFT JOIN
            gold.DimGeo G on F.RegionID = G.RegionID AND F.Country = G.Country
        

