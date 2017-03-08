-- SELECT
-- 1. Ta fram all information för alla kunder som finns (tabellen Customers). Sortera resultatet på
-- kundnamnet . Börja med ”asc” och ändra ?ll ”desc”. Vilken skillnad blir det ?
use northwind;

SELECT * FROM customers
group by ContactName asc;

SELECT * FROM customers
group by ContactName desc;

-- Ascending filter the data from A-Z increading order whereas desc filter in decreading order from Z-A.
-- 2. Ta fram kundnamn, adress och postort för alla kunder.

SELECT ContactName, Address, Region
FROM Customers;

-- 3. Ta fram adress, postort och kontaktperson för alla kunder i London.
SELECT ContactName, Address, Region
FROM Customers 
Where City = 'London';

-- 4. Ta fram alla kunder som har en kontaktperson som heter John Steel.

SELECT * from customers
WHERE ContactName='John Steel';

-- 5. Ta fram alla unika städer där det finns kunder dvs. frågan skall all?d ta bort alla dubble9er.
SELECT DISTINCT City 
FROM customers;

-- 6. Ta fram kundnamn , adress, postnummer och kontaktperson för alla kunder . Sortera dessa
-- på postnr i s?gande ordning dvs med det lägsta postnumret först.

SELECT ContactName, Address, PostalCode
FROM customers
order by PostalCode asc;

-- 7. Ändra sorteringen för fråga 6 så a9 resultatet sorteras i fallande ordning dvs med det högsta
-- postnumret först.
SELECT ContactName, Address, PostalCode
FROM customers
order by PostalCode desc;
 
 -- 8. Ta fram alla kunder som har e9 postnr som är större än 1010 och en region som är lika med WA.
SELECT * FROM customers
where PostalCode > 1010
and Region ='WA';

-- 9. Ta fram alla kunder som finns i London eller Paris.

 SELECT * FROM Customers
WHERE City IN ('Paris','London');

-- 10. Skriv en fråga som returnerar en siffra som anger antalet rader i kundtabellen.
SELECT count(CustomerID) 
FROM customers;

-- 11. Ta fram alla kunder som inte har någon ifylld region dvs där de9a saknas.
SELECT * FROM customers 
where Region IS Null;

-- 12. Ta fram namn, city och kontaktperson på alla kunder där namnet inte är lika med ”Ernst
-- Handel”. Sortera dessa kunder på namnet och i bokstavsordning.
SELECT  ContactName, City, CompanyName 
FROM customers 
where ContactName like 'Ernst Handel' 
group by ContactName asc;

-- 13. Ta fram alla kunder som har en områdeskod som an?ngen är lika med ”BC” eller ”SP” eller
-- ”WA” eller” CA”.
SELECT * FROM customers
where PostalCode IN ('BC','SP','WA','CA');

-- 14. Hur många anställda kommer från UK? Visa det med en siffra.

SELECT count(CustomerID) FROM customers
where Country like 'UK';

-- 15. Ta fram alla kunder som an?ngen har kundnamn ”Island Trading” och region ” Isle of Wight”,
-- eller kundnamnet ” White Clover Markets” och region ”WA” . Fundera på hur where delen av
-- frågan måste se ut för a9 de9a villkor skall bli rä9.

SELECT * from customers
where ContactName IN ('Island Trading', 'White Clover Markets') 
and Region IN ('Isle of Wight','WA');

