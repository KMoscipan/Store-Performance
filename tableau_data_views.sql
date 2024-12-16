/* SalesDetails View Creation*/

CREATE VIEW SalesDetails AS
SELECT 
    fs.DateKey,
    dc.ChannelName, 
    fs.StoreKey,
    fs.ProductKey,
    fs.TotalCost,
    fs.SalesAmount,
    (fs.SalesAmount - fs.TotalCost) AS GrossMargin
FROM 
    FactSales fs
INNER JOIN 
    DimChannel dc ON fs.ChannelKey = dc.ChannelKey
WHERE
    dc.ChannelName = 'Store'; 

/* SalesDetails View Access*/
SELECT * FROM SalesDetails;




/* ProductDetails View Creation*/

CREATE VIEW ProductDetails AS
SELECT 
    dp.ProductKey, 
    dp.ProductName, 
    dpsc.ProductSubcategoryName, 
    dpc.ProductCategoryName 
FROM 
    DimProduct dp
INNER JOIN 
    DimProductSubcategory dpsc ON dp.ProductSubcategoryKey = dpsc.ProductSubcategoryKey
INNER JOIN 
    DimProductCategory dpc ON dpsc.ProductCategoryKey = dpc.ProductCategoryKey;

/* ProductDetails View Access*/
SELECT * FROM ProductDetails;




/* StoreDetails View Creation*/

CREATE VIEW StoreDetails AS
SELECT 
    s.StoreKey,
    s.StoreName,
    ISNULL(EmployeeCount, 25) AS EmployeeCount, -- Use 25 as a default for NULL EmployeeCount to maintain consistency and avoid errors in demo data.
    s.SellingAreaSize,
    g.CityName,
    g.RegionCountryName AS CountryName,
    g.ContinentName
FROM 
    DimStore AS s
INNER JOIN 
    DimGeography AS g ON s.GeographyKey = g.GeographyKey
WHERE 
    s.StoreType = 'Store';

/* StoreDetails View Access*/
SELECT * FROM StoreDetails;
