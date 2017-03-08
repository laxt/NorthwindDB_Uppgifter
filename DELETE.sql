-- DELETE
use northwind;

-- 25. Kunden med kundid ”ELGI” skall ta bort. Radera denna kund från tabellen. 11. Ta bort alla
-- kunder som har kundnamn Nackademin.
DELETE FROM customers
where CustomerID='ELGI';

-- 26. Ta bort alla kunder som har city lika med JÄRFÄLLA
DELETE FROM customers
where City='JÄRFÄLLA';

-- 27. Pröva att ta bort data från Sporthall databasen. Ta bort en bana och en kund.
DROP schema Sporthall;
DROP TABLE Kundar;
DROP TABLE Banor;