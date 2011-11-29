/* recreate procedure */

DROP PROCEDURE TableSizeInsert;

DELIMITER $$

CREATE PROCEDURE TableSizeInsert (
)
BEGIN
	DECLARE row_format float;
	DECLARE total_rows float;
	DECLARE avg_row_length float;
	DECLARE total_mb int;
	DECLARE data_mb int;
	DECLARE index_mb int;

SELECT sum(data_length+index_length)/1024/1024 INTO total_mb
FROM information_schema.tables
WHERE table_schema=DATABASE() LIMIT 1;

SELECT sum(data_length)/1024/1024 INTO data_mb
FROM information_schema.tables
WHERE table_schema=DATABASE() LIMIT 1;

SELECT sum(index_length)/1024/1024 INTO index_mb
FROM information_schema.tables
WHERE table_schema=DATABASE() LIMIT 1;

SELECT count(*) INTO tables
FROM information_schema.tables
WHERE table_schema=DATABASE() LIMIT 1;

SELECT count(*) INTO indexes
FROM information_schema.statistics
WHERE table_schema=DATABASE() AND index_name<>'PRIMARY' LIMIT 1;
	
INSERT INTO DataIndexSize
(ID,TotalMB,DataMB,IndexMB,Tables,Indexes,DateCreated)
VALUES (1,row_format,total_rows,avg_row_length,total_mb,data_mb,index_mb,NOW());
	
END;

$$

DELIMITER ;
