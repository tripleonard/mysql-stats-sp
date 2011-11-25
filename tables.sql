/* create db and tables */

CREATE DATABASE sysadmin;

DROP TABLE DataIndexSize;

CREATE TABLE DataIndexSize(
	ID int AUTO_INCREMENT,
	DBName int,
	TotalMB float,
	DataMB float,
	IndexMB float,
	Tables int,
	Indexes int,
	DateCreated datetime
) ENGINE=InnoDB;

DROP TABLE DBNames;

CREATE TABLE DBNames(
	ID int,
	DBName varchar(30),
	Type varchar (30)
) ENGINE=InnoDB;


/* a join for reporting*/

CREATE VIEW Size as SELECT DBNames.Name,
	D.TotalMB,
	D.DataMB,
	D.IndexMB,
	D.Tables,
	D.Indexes,
	D.DateCreated
FROM DataIndexSize as D
JOIN DBNames on (D.ID=DBNames.ID);

/* this is the first table for recording individual table stats as opposed to whole database stats - in development */

DROP TABLE TableSize;

CREATE TABLE TableSize(
	ID int AUTO_INCREMENT,
	TableName int,
	RowFormat varchar(30),
	TotalRows int,
	AvgRowLength int,
	TotalMB float,
	DataMB float,
	IndexMB float,
	DateCreated datetime
) ENGINE=InnoDB;

DROP TABLE TableNames;

CREATE TABLE TableNames(
	ID int,
	Name varchar(30),
	Type varchar (30)
);