MySQL Database Statistics
-------------------------

-------------------------

A MySQL Stored Procedure for recording of various database statistics over time. Including:

* Data size
* Index size
* Database size
* Number of tables
* Number of indexes

This is the command to be added to cron, I call it once/day.

	mysql -h localhost -u root -ppasswd sysadmin -e "call ProdSizeInsert()"


Features in Development
-----------------------

Track the following statistics for the ten largest tables (you can increase this if needed).

* Engine type
* Number of row in table
* Avg. row length
* Total size
* Data size
* Index size

	select table_name,engine,row_format,table_rows,avg_row_length,
		(data_length+index_length)/1024/1024 as total_mb,
		(data_length)/1024/1024 as data_mb,
		(index_length)/1024/1024 as index_mb
	from information_schema.tables
	where table_schema=database()
	order by 6 desc
	limit 10;
