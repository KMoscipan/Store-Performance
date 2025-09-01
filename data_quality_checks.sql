/* FactSales Quality Check */

SELECT  
    /* Total Rows Count */
    COUNT(f.StoreKey) AS TotalRows,

    /* Missing Values (for the fact table itself) */
    SUM(CASE WHEN f.DateKey IS NULL THEN 1 ELSE 0 END) AS MissingDateKey,
    SUM(CASE WHEN f.ChannelKey IS NULL THEN 1 ELSE 0 END) AS MissingChannelKey,
    SUM(CASE WHEN f.StoreKey IS NULL THEN 1 ELSE 0 END) AS MissingStoreKey,
    SUM(CASE WHEN f.ProductKey IS NULL THEN 1 ELSE 0 END) AS MissingProductKey,
    SUM(CASE WHEN f.TotalCost IS NULL THEN 1 ELSE 0 END) AS MissingTotalCost,
    SUM(CASE WHEN f.SalesAmount IS NULL THEN 1 ELSE 0 END) AS MissingSalesAmount,

    /* Orphaned Records (Foreign Key Validation) */
    SUM(CASE WHEN d.DateKey IS NULL THEN 1 ELSE 0 END) AS OrphanedDateKey,
    SUM(CASE WHEN ch.ChannelKey IS NULL THEN 1 ELSE 0 END) AS OrphanedChannelKey,
    SUM(CASE WHEN s.StoreKey IS NULL THEN 1 ELSE 0 END) AS OrphanedStoreKey,
    SUM(CASE WHEN p.ProductKey IS NULL THEN 1 ELSE 0 END) AS OrphanedProductKey,

    /* Duplicates Check (based on a combination of keys) */
    SUM(CASE WHEN DuplicateCheck.DuplicateCount > 1 THEN 1 ELSE 0 END) AS DuplicateRows,

    /* Data Range Validation (SalesAmount and Date) */
    SUM(CASE WHEN f.SalesAmount < 0 OR f.SalesAmount > 100000000 THEN 1 ELSE 0 END) AS InvalidSalesAmountRange,
    SUM(CASE WHEN f.DateKey < '2000-01-01' OR f.DateKey > GETDATE() THEN 1 ELSE 0 END) AS InvalidDateRange,

    /* Latest Sales Date in the Fact Table */
    (SELECT MAX(DateKey) FROM FactSales) AS LastUpdatedDate

FROM FactSales f

/* Left Joins for orphaned records (foreign keys) */
LEFT JOIN DimDate d ON f.DateKey = d.DateKey
LEFT JOIN DimChannel ch ON f.ChannelKey = ch.ChannelKey
LEFT JOIN DimStore s ON f.StoreKey = s.StoreKey
LEFT JOIN DimProduct p ON f.ProductKey = p.ProductKey

/* Subquery to check for duplicates */
LEFT JOIN (
    SELECT 
        DateKey, 
        ChannelKey, 
        StoreKey, 
        ProductKey, 
        COUNT(*) AS DuplicateCount
    FROM FactSales
    GROUP BY 
        DateKey, 
        ChannelKey, 
        StoreKey, 
        ProductKey
) AS DuplicateCheck
    ON f.DateKey = DuplicateCheck.DateKey
    AND f.ChannelKey = DuplicateCheck.ChannelKey
    AND f.StoreKey = DuplicateCheck.StoreKey
    AND f.ProductKey = DuplicateCheck.ProductKey;




/* DimProduct Quality Check */

SELECT  
    /* Total Rows Count */
    COUNT(dp.ProductKey) AS TotalRows,

    /* Missing Values (for the DimProduct table itself) */
    SUM(CASE WHEN dp.ProductKey IS NULL THEN 1 ELSE 0 END) AS MissingProductKey,
    SUM(CASE WHEN dp.ProductName IS NULL THEN 1 ELSE 0 END) AS MissingProductName,
    SUM(CASE WHEN dp.ProductSubcategoryKey IS NULL THEN 1 ELSE 0 END) AS MissingProductSubcategoryKey,

    /* Duplicates Check (based on a combination of keys) */
    SUM(CASE WHEN DuplicateCheck.DuplicateCount > 1 THEN 1 ELSE 0 END) AS DuplicateRows,

FROM DimProduct dp

/* Subquery to check for duplicates */
LEFT JOIN (
    SELECT 
        ProductKey, 
        ProductName,
        ProductSubcategoryKey,
        COUNT(*) AS DuplicateCount
    FROM DimProduct
    GROUP BY 
        ProductKey, 
        ProductName, 
        ProductSubcategoryKey
) AS DuplicateCheck
    ON dp.ProductKey = DuplicateCheck.ProductKey
    AND dp.ProductName = DuplicateCheck.ProductName
    AND dp.ProductSubcategoryKey = DuplicateCheck.ProductSubcategoryKey;
	
	
	
	
/* DimStore Quality Check */

SELECT  
    /* Total Rows Count */
    COUNT(s.StoreKey) AS TotalRows,

    /* Missing Values (for the DimStore table itself) */
    SUM(CASE WHEN s.StoreKey IS NULL THEN 1 ELSE 0 END) AS MissingStoreKey,
    SUM(CASE WHEN s.StoreName IS NULL THEN 1 ELSE 0 END) AS MissingStoreName,
    SUM(CASE WHEN s.EmployeeCount IS NULL THEN 1 ELSE 0 END) AS MissingEmployeeCount,
    SUM(CASE WHEN s.SellingAreaSize IS NULL THEN 1 ELSE 0 END) AS MissingSellingAreaSize,
    SUM(CASE WHEN s.GeographyKey IS NULL THEN 1 ELSE 0 END) AS MissingGeographyKey,

    /* Data Validation (e.g., EmployeeCount should be non-negative, SellingAreaSize should be within a realistic range) */
    SUM(CASE WHEN s.EmployeeCount < 0 THEN 1 ELSE 0 END) AS InvalidEmployeeCount,
    SUM(CASE WHEN s.SellingAreaSize < 0 OR s.SellingAreaSize > 100000 THEN 1 ELSE 0 END) AS InvalidSellingAreaSize,

    /* Orphaned Records (Foreign Key Validation on GeographyKey) */
    SUM(CASE WHEN g.GeographyKey IS NULL THEN 1 ELSE 0 END) AS OrphanedGeographyKey,

    /* Duplicates Check (based on StoreKey) */
    SUM(CASE WHEN DuplicateCheck.DuplicateCount > 1 THEN 1 ELSE 0 END) AS DuplicateRows

FROM DimStore s

/* Left Join for orphaned records (foreign keys) */
LEFT JOIN DimGeography g ON s.GeographyKey = g.GeographyKey

/* Subquery to check for duplicates */
LEFT JOIN (
    SELECT 
        StoreKey, 
        COUNT(*) AS DuplicateCount
    FROM DimStore
    GROUP BY StoreKey
) AS DuplicateCheck
    ON s.StoreKey = DuplicateCheck.StoreKey;




/* Additional Query to Identify Specific Null Values in DimStore */
SELECT
    s.StoreKey,
    s.StoreName,
    s.EmployeeCount,
    s.SellingAreaSize,
    s.GeographyKey
FROM DimStore s
WHERE s.EmployeeCount IS NULL;



