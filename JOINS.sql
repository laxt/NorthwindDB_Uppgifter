-- SQL med flera tabeller (JOINS)
use northwind;
-- 55. Ta fram alla ordrar för en kund med kundid ”ALFKI”. Visa kundnamn, kundid, orderid,
-- orderdatum och shippeddate.
SELECT ContactName,customers.CustomerID,OrderID,OrderDate,ShippedDate FROM customers
INNER JOIN orders ON customers.CustomerID=orders.CustomerID
WHERE customers.CustomerID='ALFKI';

-- 56. Läs ut KundNamn, Address, City, Postalcode för alla kunder som har en order som är skapad
-- innan 1998-01-31.
SELECT ContactName, Address, City, PostalCode , OrderDate FROM customers
INNER JOIN orders ON customers.CustomerID=orders.CustomerID
WHERE OrderDate < 1998-01-31;

-- 57. Läs ut pris, produktnamn och supplierns namn för alla produkter som har ett pris större än 8.
SELECT UnitPrice,ProductName,ContactName
FROM products 
INNER JOIN suppliers ON products.SupplierID=suppliers.SupplierID
WHERE UnitPrice > 8;

-- 58. Läs ut namn på alla produkter i den order som har orderid 10287.
SELECT ProductName FROM products
INNER JOIN `order details` ON products.ProductID= `order details`.ProductID
WHERE `order details`.OrderID='10287';

-- 59. Ta fram alla produkter som suppliern med id 1 levererar. Visa produktens namn och
-- supplierns namn.
SELECT ProductName, ContactName as SupplierName FROM products 
INNER JOIN suppliers ON products.SupplierID=suppliers.SupplierID
WHERE products.SupplierID=1 ;

-- 60. Ta fram alla produkter som kunden ”Alfreds Futterkiste” köpt. Visa kundnamn, gatuadress,
-- postort, postnr samt produktens namn och antal.
SELECT ShipName as CustomerName,ShipAddress as Adress,ShipRegion as Region,ShipCity as City,
ShipPostalCode as PostalCode, `order details`.Quantity as Antal
 FROM orders 
 INNER JOIN `order details` ON orders.OrderID=`order details`.OrderID
 WHERE ShipName='Alfreds Futterkiste';
 
 -- 61. Ta fram alla produkter som leverantören ”Grandma Kelly's Homestead” levererar och som
-- innehåller texten ”berry” någonstans i produktnamnet. Texten kan vara angiven med både
-- stora och små bokstäver. Resultatet skall bara visa antalet produkter utan att visa någon
-- information om produkterna.
 
SELECT * FROM products 
INNER JOIN suppliers ON products.SupplierID=suppliers.SupplierID
WHERE ContactName ='Grandma Kelly´s Homestead' AND ProductName LIKE '%berry%';

-- 62. Räkna hur många orderrader som innehåller produkten ” Fish bean bag toy”. Räkna sedan hur
-- många exemplar av produkten (kvantitet) som sålts dvs ingår i någon order.
SELECT COUNT(ProductName),UnitsonOrder FROM products
where ProductName= 'Fish bean bag toy';

-- 63. Ta fram alla leverantörer som finns i USA och har produkter som har produkter inom
-- kategorin ”Condiments”.
SELECT * FROM suppliers
INNER JOIN products ON suppliers.SupplierID=products.SupplierID
INNER JOIN categories ON products.CategoryID= categories.CategoryID
where Country = 'USA';

-- 64. Ta fram alla produkter som sålts under februari månad år 1998 . Visa produktnamn, priset på
-- orderraden och vilken leverantör som levererar produkten. Sortera på kategori och visa även
-- namnet på kategorin för produkten.
SELECT DISTINCT ProductName,products.UnitPrice,SupplierID, categories.CategoryName FROM customers
INNER JOIN orders ON customers.CustomerID=orders.CustomerID
INNER JOIN `order details` ON `order details`.OrderID=orders.OrderID
INNER JOIN products on `order details`.ProductID=products.ProductID
INNER JOIN categories ON products.CategoryID= categories.CategoryID
where Year(orders.ShippedDate)='1998';

-- 65. Ta fram alla leverantörer som finns i London och har produkter som kostar mer än 8,00.
SELECT * FROM suppliers 
INNER JOIN products ON suppliers.SupplierID=products.SupplierID
WHERE City='London' AND UnitPrice>8; 

-- 66. Visa namn de leverantörer vars namn börjar på bokstaven B och har levererat produkter
-- under februari månad år 2012 dvs vars produkter finns med i någon order under denna tid.
SELECT ContactName FROM suppliers
INNER JOIN products ON suppliers.SupplierID=products.SupplierID
INNER JOIN `order details` ON `order details`.ProductID=products.ProductID
INNER JOIN orders ON `order details`.OrderID=orders.OrderID
WHERE ContactName like 'B%'
AND MONTH(ShippedDate)= 2 AND YEAR(ShippedDate)=2012;

-- 67. Ta fram namn på alla kunder som har köpt produkten ”Tunnbröd”. Visa också vilket datum de
-- köpte produkten.
SELECT ContactName, ProductName,ShippedDate FROM customers
INNER JOIN orders ON customers.CustomerID=orders.CustomerID
INNER JOIN `order details` ON orders.OrderID=`order details`.OrderID
INNER JOIN products ON `order details`.ProductID=products.ProductID
WHERE ProductName='Tunnbröd';

-- 68. Vilken produktgrupp (category) har flest produkter? Hur många? Visa alla grupper och
-- sortera så att den med flest produkter hamnar överst i listan.
SELECT ProductName, SUM(UnitsOnOrder) as ProductsNumber from products
GROUP BY ProductName
ORDER BY SUM(UnitsOnOrder) DESC
LIMIT 20;

-- 69. Hur många order har fraktbolag(shipper) ” United Package” skickat till Sverige under 1998?
-- Visa en siffra på hur många ordrar.
SELECT count(ShipName) FROM orders
WHERE ShipName='United Package' AND ShipCountry='Sweden' AND Year(ShippedDate)='1998';

-- 70. Ta fram alla produkter som kunden ”Ernst Handel” köpt. Visa kundnamn, gatuadress, postort,
-- postnr samt leverantörens och produktens namn. I resultatet skall dels kundens postnr och
-- postort slås ihop och visas som en kolumn med alias ”Postadress”. Dessutom skall
-- leverantörens och produktens namn slås ihop till en kolumn med ett bindestreck emellan.
-- Alias för de9a skall vara ”ProduktInformation”.
SELECT customers.ContactName,customers.Address,CONCAT(customers.City ,' ', customers.PostalCode) as PostalAddress,
CONCAT(suppliers.ContactName ,+'-' ,+ProductName) as ProductInformation 
FROM customers
INNER JOIN orders ON customers.CustomerID=orders.CustomerID
INNER JOIN `order details` ON `order details`.OrderID=orders.OrderID
INNER JOIN products ON `order details`.ProductID=products.ProductID
INNER JOIN suppliers ON products.SupplierID=suppliers.SupplierID;

-- 71. Hur stor kvantitet av produkten ” Wimmers gute Semmelknödel” har sålts under februari
-- månad 1997 ? Visa bara en siffra .
SELECT count(products.ProductName) FROM products
INNER JOIN `order details` ON `order details`.ProductID=products.ProductID
INNER JOIN orders on `order details`.OrderID=orders.OrderID
WHERE products.ProductName='Wimmers gute Semmelknödel'
AND Month(ShippedDate)=2 ANd Year(ShippedDate)=1997;

-- 72. Visa namn de leverantörer vars namn börjar på bokstaven B och har levererat produkter
-- under 1998 dvs vars produkter finns med i någon order under denna tid. Visa deras Adress
-- samt postnr och postort sammanslaget tll en kolumn med alias ”Postadress”.


SELECT DISTINCT ContactName, CONCAT(Address,' ',Region,' ',PostalCode)as PostAddress FROM suppliers
INNER JOIN products ON suppliers.SupplierID=products.SupplierID
INNER JOIN `order details` ON `order details`.ProductID=products.ProductID
INNER JOIN orders ON `order details`.OrderID=orders.OrderID
WHERE ContactName like 'B%'
AND  YEAR(ShippedDate)=1998;



