/* sample insert data */

INSERT INTO DBNames
	(ID,Name,Type)
	VALUES(1,'eb105_production','production');

SELECT DBNames.Name,
	D.TotalMB,
	D.DataMB,
	D.IndexMB,
	D.Tables,
	D.Indexes,
	D.DateCreated
FROM DataIndexSize as D
JOIN DBNames on (D.ID=DBNames.ID);