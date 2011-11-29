MySQL Database Statistics
-------------------------

-------------------------

A MySQL Stored Procedure for recording of various MySQL database statistics over time. Including:

* Data size
* Index size
* Database size
* Number of tables
* Number of indexes

I've called the database 'sysadmin' but you can change it to anything you like.  For clarity I have split the create database and tables code from procedure. So, first run 'tables.sql' then run 'procedure.sql'.


This is the command to be added to cron, I call it once/day.

	mysql -h localhost -u root -p sysadmin -e "call DataIndexSizeInsert()"


Features in Development
-----------------------

Track the following statistics for the ten largest tables (you can increase this if needed).

* Engine type
* Number of row in table
* Avg. row length
* Total size
* Data size
* Index size

Below are the queries for the basis of this entire project:

	select table_schema,
		sum(data_length+index_length)/1024/1024 as total_mb,
		sum(data_length)/1024/1024 as data_mb,
		sum(index_length)/1024/1024 as index_mb,
		count(*) as tables,
		current_timestamp as date
	from information_schema.tables
	where table_schema=DATABASE()
	group by table_schema
	order by 2 desc;


	select table_name,row_format,table_rows,avg_row_length,
		(data_length+index_length)/1024/1024 as total_mb,
		(data_length)/1024/1024 as data_mb,
		(index_length)/1024/1024 as index_mb
	from information_schema.tables
	where table_schema=DATABASE()
	order by 6 desc
	limit 10;
