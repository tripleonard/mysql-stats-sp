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
	Name varchar(30),
	Type varchar (30)
);

CREATE TABLE LargeTable(
	ID int,
	TableName int,
	TotalRows int,
	AvgRowLength int,
	TotalMB float,
	DataMB float,
	IndexMB float
);
