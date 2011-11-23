mysql-stats-sp 
--------------

A MySQL stored procedure which creates a historical record of various statistics.  

Including:
-data size
-index size
-database size
-number of tables
-number of indexes

This was developed and tested on MySQL 5.1


# command to be added to cron, I run it once per week
# note: this should not be running _on_ th production db, "observe without changing" (or something like that)

mysql -h localhost -u root -ppasswd sysadmin -e "call ProdSizeInsert()"



Features to add
---------------

Query for table size stats

select table_name,engine,row_format,table_rows,avg_row_length,
	(data_length+index_length)/1024/1024 as total_mb,
	(data_length)/1024/1024 as data_mb,
	(index_length)/1024/1024 as index_mb
from information_schema.tables
where table_schema=database()
order by 6 desc
limit 10;
