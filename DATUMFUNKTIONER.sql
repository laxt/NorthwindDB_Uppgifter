-- SQL datumfunktioner
use northwind;
-- 48. Ta fram alla rader från Orders där orderdatum är ?digare än dagens datum.
Select * from orders
where OrderDate < now();

-- 49. Ta fram alla ordrar i Orders som har orderdatum under 1996. Du måste använda en
-- datumfunkton för detta.
Select * from orders
where year(orderdate) = '1996';

-- 50. Ta fram alla ordrar i Orders som är mer än ett år äldre än dagens datum. Du måste göra detta
-- med hjälp av datumfunktioner.

select *
 from orders 
where OrderDate > TIMESTAMPADD(Year,1, '2017-03-06');

-- 51. Ta fram alla ordrar som lades under 1996 och under februari månad. Du måste göra detta
-- med hjälp av datumfunktioner.
Select  * from orders
where year(orderdate) = 1996 and month(orderdate)=2;

-- 52. Ta fram alla ordrar som har lagts den 30:e någon månad. Utgå från orderdatum
Select * from orders
where day(orderdate) =30;

-- 53. Ta fram alla ordrar som har lagts e0er den 6:e någon månad under 1996 och 1997. Utgå från
-- orderdatum.
Select * from orders
where day(orderdate) =6 and year(orderdate) in ('1996','1997');

-- 54. Ta fram alla ordrar som skapats de senaste 6 månaderna. Utgå från dagens datum.
Select * from orders
where orderdate >= DATE_SUB(now(), INTERVAL 6 MONTH);
