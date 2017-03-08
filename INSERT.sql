-- INSERT 
use northwind;
-- 16. Lägg ?ll en ny kund som heter Nackademin och ligger på Tomtebodav 3A , 17156 i SOLNA.
-- Kunden har en kontaktperson som heter Per Svensson. Du måste även lägga in e9 kundid
-- och det skall vara NACK.

INSERT INTO customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('NACK','Nackademin', 'Per Svensson', '', 'Tomtebodav 3A', 'Solna','',17156,'Sweden', '','');

-- 17. Lägg ?ll en ny kund som heter BR leksaker och har adressen Barkarby Handelsplats
-- postnummer 177 38 och ligger i JÄRFÄLLA. Kunden har en kontaktperson som heter Anna
-- Persson . Du måste även lägga in e9 kundid och det skall vara BRLE.
INSERT INTO customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('BRLE','BR Leksaker', 'Anna Svensson', '', 'Barkarby Handelplats', 'Järfälla','',17738,'', '','');

-- 18. Lägg ?ll en ny kund som heter Elgiganten och har adressen Kungens Kurva och ligger i
-- KUNGENS KURVA . Kunden har en kontaktperson som heter Malin Lundkvist. Du måste
-- även lägga in e9 kundid och det skall vara ELGI.
INSERT INTO customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('ELGI','Elgigatan', 'Malin Lundkvist', '', 'Kungens Kurva', 'KUNGENS KURVA','','','', '','');

-- 19. Försök a9 lägga in en kund utan a9 ange kundnamn. Vad händer? Varför får du det
-- felmeddelande som dyker upp?

INSERT INTO customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES (NULL,'Elgigatan', '', '', 'Bandhagen', 'Stockholm','','','', '','');
-- Däröre att CustomerID är notnull så det kan inte vara null.

-- 20. Fyll databasen som du skapat för en Sporthall med data. Lägg in nya kunder, banor och bokningar.

CREATE SCHEMA IF NOT EXISTS Sporthall DEFAULT CHARACTER SET utf8 ;
USE Sporthall ;

-- -----------------------------------------------------
-- Table `Sporthall`.`Kunder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sporthall`.`Kunder` (
  `KundId` CHAR(6) NOT NULL,
  `KundNamn` VARCHAR(45) NULL,
  `Adress` VARCHAR(45) NULL,
  `Ort` VARCHAR(45) NULL,
  `City` INT NULL,
  `Land` VARCHAR(45) NULL,
  PRIMARY KEY (`KundId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sporthall`.`Banor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sporthall`.`Banor` (
  `BanorId` CHAR(6) NOT NULL,
  `BanorNamn` VARCHAR(45) NULL,
  PRIMARY KEY (`BanorId`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Sporthall`.`Bokningar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sporthall`.`Bokningar` (
  `BokId` CHAR(6) NOT NULL,
  `BokNamn` VARCHAR(45) NULL,
  PRIMARY KEY (`BokId`))
ENGINE = InnoDB;

-- För insert 
USE `Sporthall`;
INSERT INTO `Sporthall`.`Kunder` (`kundId`, `KundNamn`, `Adress`, `Ort`, `City`, `Land`) VALUES ('K111', 'Byle Dan', 'Blåvägen 34', 'Bandhagen', 'Stockholm', 'Sweden');

INSERT INTO `Sporthall`.`Banor` (`BanorId`,`banorNamn`) VALUES ('B111','Btest');

INSERT INTO `Sporthall`.`Bokningar` (`BokId`,`BokNamn`) VALUES ('BO111','BotestQ');
