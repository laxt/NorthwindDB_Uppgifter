-- SQL aggregateFunktioner
use northwind;
-- 39. Ta fram pris för den dyraste produkten som finns dvs den med högst pris för produkten.
SELECT MAX(UnitPrice) as Highestprice,ProductName  FROM products;

-- 40. Vilket datum skapades den äldsta kundordern som finns lagrad. Vilket är det senaste datum
-- som någon order skapades.
SELECT * FROM orders WHERE OrderDate ORDER BY OrderDate ASC LIMIT 1;
SELECT * FROM orders WHERE OrderDate ORDER BY OrderDate DESC LIMIT 1;

-- 41. Ta fram högsta pris, lägsta pris och medelpris för de produkter som finns.
SELECT MAX(UnitPrice) as Highestprice, MIN(UnitPrice) as LowestPrice,
 AVG(UnitPrice) as MedelPris FROM products;
 
 -- 42. Ta fram en lista på alla produkter som har ett pris mellan 10 och 25
 SELECT * FROM products
 WHERE UnitPrice BETWEEN 10 AND 25;
 
 -- 43. Ta fram en lista på alla orderrader och beräkna totalt pris per orderrad dvs kvantitet gånger
-- pris. Sätt alias på resultatet till ”PrisOrderRad”
SELECT ProductID, ProductName, (QuantityPerUnit*UnitPrice) as PrisOrderRad
 FROM products;
 
 -- 44. Läs orderdatum och ordernr för de i de ordrar som har ordernr mellan 20006 och 20008.
 SELECT OrderID, OrderDate FROM orders
 WHERE OrderID BETWEEN 20006 AND 20008 ;
 
 -- 45. Ta fram den största kvan?tet som finns på någon orderrad (order details) för produkten med id3
 SELECT Max(Quantity) as Quantity,OrderID, ProductID, UnitPrice, Discount FROM `order details`
 WHERE ProductID = 3;

-- 46. Ta fram minsta totalpris (pris gånger kvantitet) för en orderrad där produkten har produkt id3.
 SELECT OrderID, ProductID, MIN(UnitPrice*Quantity) as MinstTotalPris, Discount FROM `order details`
 WHERE ProductID = 3;
 
 -- 47. Ta fram unitprice och productname för de tre dyraste produkterna i products tabellen. Ett
-- tips är att använda fuktionen Top tillsammans med en sortering.
SELECT ProductName, UnitPrice FROM products
GROUP BY UnitPrice DESC , Productname ASC
LIMIT 0,3;



