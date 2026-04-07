DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS purchase_prices;
DROP TABLE IF EXISTS vendor_sales_summary;

CREATE TABLE purchases (
    InventoryId INTEGER,
    Store INTEGER,
    Brand INTEGER,
    Description TEXT,
    Size TEXT,
    VendorNumber INTEGER,
    VendorName TEXT,
    PONumber INTEGER,
    PODate TEXT,
    ReceivingDate TEXT,
    InvoiceDate TEXT,
    PayDate TEXT,
    PurchasePrice REAL,
    Quantity INTEGER,
    Dollars REAL,
    Classification INTEGER
);

CREATE TABLE sales (
    InventoryId INTEGER,
    Store INTEGER,
    Brand INTEGER,
    Description TEXT,
    Size TEXT,
    SalesQuantity INTEGER,
    SalesDollars REAL,
    SalesPrice REAL,
    SalesDate TEXT,
    Volume REAL,
    Classification INTEGER,
    ExciseTax REAL,
    VendorNo INTEGER,
    VendorName TEXT
);

CREATE TABLE purchase_prices (
    Brand INTEGER,
    Description TEXT,
    Price REAL,
    Size TEXT,
    Volume REAL,
    Classification INTEGER,
    PurchasePrice REAL,
    VendorNumber INTEGER,
    VendorName TEXT
);

CREATE TABLE vendor_sales_summary (
    VendorNumber INTEGER,
    VendorName TEXT,
    Brand INTEGER,
    Description TEXT,
    PurchasePrice REAL,
    ActualPrice REAL,
    Volume REAL,
    TotalPurchaseQuantity INTEGER,
    TotalPurchaseDollars REAL,
    TotalSalesQuantity INTEGER,
    TotalSalesPrice REAL,
    TotalSalesDollars REAL,
    TotalExciseTax REAL,
    FreightCost REAL,
    GrossProfit REAL,
    ProfitMargin REAL,
    StockTurnover REAL,
    SalestoPurchaseRatio REAL
);
