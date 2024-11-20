SELECT 
    -- Total Rows Count
    COUNT(*) AS TotalRows,

    -- Missing Values (for the fact table itself)
    SUM(CASE WHEN f.StrategyPlanKey IS NULL THEN 1 ELSE 0 END) AS MissingStrategyPlanKey,
    SUM(CASE WHEN f.DateKey IS NULL THEN 1 ELSE 0 END) AS MissingDateKey,
    SUM(CASE WHEN f.EntityKey IS NULL THEN 1 ELSE 0 END) AS MissingEntityKey,
    SUM(CASE WHEN f.ScenarioKey IS NULL THEN 1 ELSE 0 END) AS MissingScenarioKey,
    SUM(CASE WHEN f.AccountKey IS NULL THEN 1 ELSE 0 END) AS MissingAccountKey,
    SUM(CASE WHEN f.CurrencyKey IS NULL THEN 1 ELSE 0 END) AS MissingCurrencyKey,
    SUM(CASE WHEN f.ProductCategoryKey IS NULL THEN 1 ELSE 0 END) AS MissingProductCategoryKey,
    SUM(CASE WHEN f.Amount IS NULL THEN 1 ELSE 0 END) AS MissingAmount,

    -- Orphaned Records (Foreign Key Validation)
    SUM(CASE WHEN d.DateKey IS NULL THEN 1 ELSE 0 END) AS OrphanedDateKey,
    SUM(CASE WHEN e.EntityKey IS NULL THEN 1 ELSE 0 END) AS OrphanedEntityKey,
    SUM(CASE WHEN s.ScenarioKey IS NULL THEN 1 ELSE 0 END) AS OrphanedScenarioKey,
    SUM(CASE WHEN a.AccountKey IS NULL THEN 1 ELSE 0 END) AS OrphanedAccountKey,
    SUM(CASE WHEN c.CurrencyKey IS NULL THEN 1 ELSE 0 END) AS OrphanedCurrencyKey,
    SUM(CASE WHEN p.ProductCategoryKey IS NULL THEN 1 ELSE 0 END) AS OrphanedProductCategoryKey,

    -- Duplicates Check (based on a combination of keys)
    SUM(CASE WHEN DuplicateCheck.DuplicateCount > 1 THEN 1 ELSE 0 END) AS DuplicateRows,

    -- Data Range Validation (Amount and Date)
    SUM(CASE WHEN f.Amount < 0 OR f.Amount > 100000000 THEN 1 ELSE 0 END) AS InvalidAmountRange,
    SUM(CASE WHEN f.DateKey < '2000-01-01' OR f.DateKey > GETDATE() THEN 1 ELSE 0 END) AS InvalidDateRange,

    -- Data Freshness
    (SELECT MAX(DateKey) FROM FactStrategyPlan) AS LastUpdatedDate

FROM FactStrategyPlan f
-- Left Joins for orphaned records (foreign keys)
LEFT JOIN DimDate d ON f.DateKey = d.DateKey
LEFT JOIN DimEntity e ON f.EntityKey = e.EntityKey
LEFT JOIN DimScenario s ON f.ScenarioKey = s.ScenarioKey
LEFT JOIN DimAccount a ON f.AccountKey = a.AccountKey
LEFT JOIN DimCurrency c ON f.CurrencyKey = c.CurrencyKey
LEFT JOIN DimProductCategory p ON f.ProductCategoryKey = p.ProductCategoryKey

-- Subquery to check for duplicates
LEFT JOIN (
    SELECT StrategyPlanKey, DateKey, EntityKey, ScenarioKey, AccountKey, CurrencyKey, ProductCategoryKey, COUNT(*) AS DuplicateCount
    FROM FactStrategyPlan
    GROUP BY StrategyPlanKey, DateKey, EntityKey, ScenarioKey, AccountKey, CurrencyKey, ProductCategoryKey
) DuplicateCheck
    ON f.StrategyPlanKey = DuplicateCheck.StrategyPlanKey
    AND f.DateKey = DuplicateCheck.DateKey
    AND f.EntityKey = DuplicateCheck.EntityKey
    AND f.ScenarioKey = DuplicateCheck.ScenarioKey
    AND f.AccountKey = DuplicateCheck.AccountKey
    AND f.CurrencyKey = DuplicateCheck.CurrencyKey
    AND f.ProductCategoryKey = DuplicateCheck.ProductCategoryKey;
