/* create db and tables */

CREATE DATABASE sysadmin;

DROP TABLE DataIndexSize;

CREATE TABLE DataIndexSize(
	ID int,
	TotalMB float,
	DataMB float,
	IndexMB float,
	Tables int,
	Indexes int,
	DateCreated datetime
);

DROP TABLE DBNames;

CREATE TABLE DBNames(
	ID int,
	DBName varchar(30),
	Type varchar (30)
);

/* this is the first table for recording individual table stats as opposed to whole database stats - in development */

CREATE TABLE TableSize(
	ID int,
	TotalRows int,
	AvgRowLength int,
	TotalMB float,
	DataMB float,
	IndexMB float
);

DROP TABLE TableNames;

CREATE TABLE TableNames(
	ID int,
	Name varchar(30),
	Type varchar (30)
);