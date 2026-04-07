-- Top vendors by total purchase spend

SELECT
    VendorNumber,
    VendorName,
    SUM(Dollars) AS TotalPurchaseSpend
FROM purchases
GROUP BY VendorNumber, VendorName
ORDER BY TotalPurchaseSpend DESC
LIMIT 10;

--Top vendors by total sales revenue

SELECT
    VendorNo AS VendorNumber,
    VendorName,
    SUM(SalesDollars) AS TotalSalesRevenue
FROM sales
GROUP BY VendorNo, VendorName
ORDER BY TotalSalesRevenue DESC
LIMIT 10;

--Vendor purchase spend vs sales revenue with estimated profitability

WITH purchase_totals AS (
    SELECT
        VendorNumber,
        MIN(VendorName) AS VendorName,
        SUM(Dollars) AS TotalPurchaseSpend
    FROM purchases
    GROUP BY VendorNumber
),

sales_totals AS (
    SELECT
        VendorNo AS VendorNumber,
        MIN(VendorName) AS VendorName,
        SUM(SalesDollars) AS TotalSalesRevenue
    FROM sales
    GROUP BY VendorNo
)

SELECT
    p.VendorNumber,
    p.VendorName,
    p.TotalPurchaseSpend,
    s.TotalSalesRevenue,
    s.TotalSalesRevenue - p.TotalPurchaseSpend AS EstimatedProfit,
    ROUND((s.TotalSalesRevenue - p.TotalPurchaseSpend) / s.TotalSalesRevenue, 3) AS EstimatedProfitMargin
FROM purchase_totals p
JOIN sales_totals s
    ON p.VendorNumber = s.VendorNumber
ORDER BY EstimatedProfit DESC
LIMIT 10;


--Vendor sales-to-purchase efficiency 

WITH purchase_totals AS (
    SELECT 
        VendorNumber,
        MIN(VendorName) AS VendorName,
        SUM(Dollars) AS TotalPurchaseSpend
    FROM purchases
    GROUP BY VendorNumber
),

sales_totals AS (
    SELECT
        VendorNo AS VendorNumber,
        SUM(SalesDollars) AS TotalSalesRevenue
    FROM sales
    GROUP BY VendorNo
)

SELECT
    p.VendorNumber,
    p.VendorName,
    p.TotalPurchaseSpend,
    s.TotalSalesRevenue,
    ROUND(s.TotalSalesRevenue / p.TotalPurchaseSpend, 2) AS SalesToPurchaseRatio
FROM purchase_totals p
JOIN sales_totals s
    ON p.VendorNumber = s.VendorNumber
WHERE p.TotalPurchaseSpend >= 100000
ORDER BY SalesToPurchaseRatio DESC
LIMIT 10;

--Vendors with the highest sales volume

SELECT
    VendorNo AS VendorNumber,
    Min(VendorName) AS VendorName,
    SUM(SalesQuantity) AS TotalUnitsSold
FROM sales
GROUP BY VendorNo
ORDER BY TotalUnitsSold DESC
LIMIT 10;
