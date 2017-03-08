-- SQL strängfunkAoner

use northwind;
-- 28. Ta fram alla kunder som saknar region dvs. där värdet är NULL.
SELECT * FROM customers
WHERE Region= '';

-- 29. Ta istället fram alla kunder som har en angiven region dvs där värdet inte är NULL. En tom
-- textsträng räknas som e9 värde.
SELECT * FROM customers
WHERE Region IS NOT NULL;

-- 30. Ta fram alla kunders namn och region. I de fall där region är NULL, returnera istället texten
-- ’Region saknas’ i svaret på frågan.
update customers set Region = 'Region missing'
where Region IS NULL;

SELECT ContactName, region FROM customers;

-- 31. Skapa en fråga som visar alla kunders postort och postnr som e9 sammansa9 resultat med
-- e9 blanktecken emellan. Ge resultatet namnet (alias) Postadress.
select CONCAT_WS(Region , PostalCode) as PostalAddress from customers;

-- 32. Vilken/vilka produkter är slut på lager? Visa namnet på produkten.
select ProductName from products
where UnitsInStock = 0;

-- 33. Ta fram alla kontaktpersoner vars namn börjar på J
Select ContactName from customers
where ContactName like 'J%';

-- 34. Ta fram namn på alla kunder vars namn innehåller texten ” market” någonstans i namnet .
Select ContactName from customers
where ContactName like '%market%';

-- 35. Ta fram alla kunder som har en adress där gatunamnet slutar på ”blvd.”.
Select * from customers 
where Address like '%blvd'; 

-- 36. Ta fram alla kunder som an?ngen finns i Berlin, Madrid eller Paris. Du har lärt dig a9 göra
-- de9a på två sä9. Det ena är a9 använda OR i where delen av frågan. Vilket är det andra ?
-- Skriv kod för båda sä9en.
Select * from customers
where City in ('Berlin', 'Madrid', 'Paris');

Select * from customers
where City = 'Berlin' OR City= 'Madrid' OR City='Paris';

-- 37. Ta fram orderdatum för alla ordrar och visa bara år och månad i datumet, inte vilken dag det
-- är . Det betyder de 7 första tecknen i datumet. Sä9 som alias på resultatet, ”Ordermånad”.
select left(OrderDate,7) as Ordermånad from orders;

-- 38. Ta fram alla leverantörer som har e9 namn som innehåller ”bear”. Det kan vara angivet med
-- an?ngen små eller stora bokstäver. Visa leverantörens namn, land och region. Land och
-- region skall vara sammanslaget ?ll en kolumn i resultatet och ha alias ”Landregion”. Se ?ll a9
-- det bara finns e9 blanktecken mellan land och region.
select ContactName, concat(Country, ' ',Region) as CountryRegion from suppliers
where ContactName like'%bear%';



