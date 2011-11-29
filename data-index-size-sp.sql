/* recreate procedure */

DROP PROCEDURE DataIndexSizeInsert;

DELIMITER $$

CREATE PROCEDURE DataIndexSizeInsert (
)
BEGIN
	DECLARE total_mb float;
	DECLARE data_mb float;
	DECLARE index_mb float;
	DECLARE tables int;
	DECLARE indexes int;

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
VALUES (1,total_mb,data_mb,index_mb,tables,indexes,NOW());
	
END;

$$

DELIMITER ;
