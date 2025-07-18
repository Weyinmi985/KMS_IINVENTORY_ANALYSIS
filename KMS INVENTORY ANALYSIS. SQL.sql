Create schema  abuja_kms_stores;
Use abuja_kms_stores;

 -- Imported the CSV file 
SELECT * FROM abuja_kms_stores.`kms sql case study`;

-- 1. PRODUCT CATEGORY WITH HIGHEST SALES
Select  `Product Category`, SUM(Sales) as TotalSales
From `kms sql case study`
Group by `Product Category`
Order by TotalSales Desc
Limit 1;


-- 2. TOP 3 AND BOTTOM 3 REGIONS BY SALES
-- TOP 3 SALES
Select Region, SUM(Sales) as TotalSales
from `kms sql case study`
Group by Region
Order by TotalSales desc
Limit 3;

-- BOTTOM SALES
Select Region, SUM(Sales) as TotalSales
from `kms sql case study`
Group by Region
Order by TotalSales Asc
Limit 3;


-- 3. TOTAL SALES OF APPLIANCES IN ONTARIO
Select SUM(Sales) as ApplianceSales
From `kms sql case study`
Where `Product Category` = 'Appliances' and Region = 'Ontario';


-- 4. Advice for Bottom 10 Customers
Select `Customer Name`, SUM(Sales) as TotalSales
From `kms sql case study`
Group by `Customer Name`
Order by TotalSales Asc
Limit 10;


-- 5. SHIPPING METHOD WITH HIGHEST COST
Select `Ship Mode`, SUM(`Shipping Cost`) as TotalShippingCost
From `kms sql case study`
Group by `Ship Mode`
Order by TotalShippingCost Desc
Limit 1;


-- CASE SCENARIO 2

-- 6. MOST VALAUABLE CUSTOMERS AND THEIR PURCHASES
Select `Customer Name`, SUM(Sales) as TotalSales
From `kms sql case study`
Group by `Customer Name`
Order by TotalSales Desc
Limit 10;

Select `Customer Name`, `Product Category`, SUM(Sales) AS CategorySales
From `kms sql case study`
Where `Customer Name` 
Group by `Customer Name`, `Product Category` 
Order by `Customer Name`
Limit 10;


-- 7. TOP SMALL BUSINESS CUSTOMER BY SALES
Select `Customer Name`, SUM(Sales) as TotalSales
From `kms sql case study`
Where `Customer Segment` = "Small Business"
Group By `Customer Name`
Order By TotalSales Desc
Limit 1;


-- 8. CORPORATE CUSTOMER WITH MOST ORDERS (2009-2012)
Select `Customer Name`, COUNT(Distinct `Order ID`) As OrderCount
From `kms sql case study`
Where `Customer Segment` = "Corporate"
Group By `Customer Name`
Order By OrderCount Desc
Limit 1;


-- 9. MOST PROFITABLE CONSUMER CUSTOMER
Select `Customer Name` , SUM(Profit) AS TotalProfit
From `kms sql case study`
Where `Customer Segment` = 'Consumer'
Group By `Customer Name`
Order By TotalProfit DESC
LIMIT 1;


-- 10. CUSTOMER WHO RETURNED ITEMS AND THEIR SEGMENT
Select `Customer Name`, `Customer Segment`
From `kms sql case study`
Where `Order Priority` = "Not Specified"
Group By `Customer Name`, `Customer Segment`
Order By  `Customer Name`, `Customer Segment` Desc ;


-- 11. EVALUATE SHIPING COST VS ORDER PRIORITY
Select `Ship Mode`, `Order Priority`, COUNT(*) AS TotalOrders, 
       AVG(`Shipping Cost`) AS AvgShippingCost
       From `kms sql case study`
Group By `Ship Mode`, `Order Priority`
Order By `Order Priority`, `Ship Mode`;




 

