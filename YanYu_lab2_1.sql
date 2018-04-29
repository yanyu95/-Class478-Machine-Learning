#1
CREATE TABLE PerformanceTypes(
PerformanceTypeName VARCHAR2(25) PRIMARY KEY);

CREATE TABLE Performers(
PerformerID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR2(25),
LastName VARCHAR2(25),
Address VARCHAR2(25),
PerformanceTypeName VARCHAR2(25),
CONSTRAINT PerformanceTypeName_fk FOREIGN KEY (PerformanceTypeName)
REFERENCES PerformanceTypes(PerformanceTypeName));

CREATE TABLE Arenas(
ArenaID INT NOT NULL PRIMARY KEY,
ArenaName VARCHAR2(25),
City VARCHAR2(25),
Capacity INT);

CREATE TABLE Concerts(
PerformerID INT NOT NULL,
ArenaID INT NOT NULL,
ConcertDate DATE NOT NULL,
PRIMARY KEY (PerformerID, ArenaID, ConcertDate),
CONSTRAINT ArenaID_fk FOREIGN KEY (ArenaID)
REFERENCES Arenas(ArenaID),
CONSTRAINT PerformerID_fk FOREIGN KEY (PerformerID)
REFERENCES Performers(PerformerID));


#2
INSERT INTO PerformanceTypes
(PerformanceTypeName) VALUES('singer');

INSERT INTO PerformanceTypes
(PerformanceTypeName) VALUES('dancer');

INSERT INTO PerformanceTypes
(PerformanceTypeName) VALUES('comedian');

#3
ALTER TABLE Performers
ADD (DateOfBirth DATE);

#4
INSERT INTO Performers
(PerformerID, FirstName, LastName, Address, PerformanceTypeName) VALUES('1', 'John', 'Dow', 'Annapolis, MD', 'singer');

#5
INSERT INTO Performers
(PerformerID, FirstName, LastName, Address, PerformanceTypeName) VALUES('2', 'Yan', 'Yu', 'Chicago, IL', 'painter');

#6
INSERT INTO Performers
(PerformerID, FirstName, LastName, Address, PerformanceTypeName) VALUES('2', 'Matt', 'Smith', 'Baltimore, MD', 'dancer');

INSERT INTO Performers
(PerformerID, FirstName, LastName, Address, PerformanceTypeName) VALUES('3', 'Jane', 'Brown', 'New York, NY', 'dancer');

INSERT INTO Performers
(PerformerID, FirstName, LastName, Address, PerformanceTypeName) VALUES('4', 'Jennifer', 'Shade', 'Seattle, WA', 'dancer');

#7
UPDATE Performers
SET    DateOfBirth = TO_DATE('1990-03-02','yyyy-mm-dd')
WHERE  PerformerID = 1;

#8
DELETE FROM Performers
WHERE  FirstName = 'Matt' AND LastName = 'Smith';

#9
DELETE FROM PerformanceTypes
WHERE  PerformanceTypeName = 'singer';

#111
UPDATE Performers
SET    PerformanceTypeName = 'dance performer'
WHERE  PerformanceTypeName = 'dancer';

UPDATE PerformanceTypes
SET    PerformanceTypeName = 'dance performer'
WHERE  PerformanceTypeName = 'dancer';

#13
INSERT INTO Arenas
(ArenaID) VALUES('1');

INSERT INTO Arenas
(ArenaID) VALUES('2');

INSERT INTO Arenas
(ArenaID) VALUES('3');

#14
INSERT INTO Concerts
(PerformerID, ArenaID, ConcertDate) VALUES('3', '1', '1-Jan-2018');

INSERT INTO Concerts
(PerformerID, ArenaID, ConcertDate) VALUES('3', '1', '2-Jan-2018');

#15
CREATE TABLE Dancers(
PerformerID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR2(25),
LastName VARCHAR2(25),
Address VARCHAR2(25),
PerformanceTypeName VARCHAR2(25),
DateOfBirth DATE,
CONSTRAINT PerformanceTypeName_fk1 FOREIGN KEY (PerformanceTypeName)
REFERENCES PerformanceTypes(PerformanceTypeName));

#16
INSERT INTO Dancers(PerformerID, FirstName, LastName, Address, PerformanceTypeName, DateOfBirth)
SELECT PerformerID, FirstName, LastName, Address, PerformanceTypeName, DateOfBirth FROM Performers
WHERE PerformanceTypeName = 'dancer';