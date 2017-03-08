-- UPDATE
use northwind;
-- 21. Du glömde lägga in contact ?tle för kunden ”Nackademin”. Den skall vara ”Program
-- Manager”. Uppdatera tabellen så a9 den rik?ga ?teln kommer in.
UPDATE customers 
SET ContactTitle='Program Manager'
where CustomerID='NACK';

-- 22. Du glömde lägga in region för kunden BR leksaker. Den skall vara SO. Uppdatera tabellen så
-- a9 den rik?ga regionen kommer in.

UPDATE customers 
SET Region='SO'
where CustomerID='BRLE';

-- 23. Du glömde lägga in postnummer och country för kunden Elgiganten. Postnummer skall vara
-- 14175 och region skall vara KU. Uppdatera tabellen så a9 dessa uppgi0er kommer in.
UPDATE customers 
SET PostalCode=14175 and Region='KU'
where CustomerID='ELGI';

-- 24. Uppdatera alla de tre nya kunderna sam?digt ( Nackademin, BR leksaker , Elgiganten) och
-- sä9 land ?ll ”Sweden” för alla. Gör de9a i en och samma query.
UPDATE customers 
SET Country='Sweden'
where CustomerID IN ('NACK','BRLE','ELGI');




