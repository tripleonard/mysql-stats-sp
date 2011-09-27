CREATE VIEW Size as SELECT DBNames.DBName,
	D.TotalMB,
	D.DataMB,
	D.IndexMB,
	D.Tables,
	D.Indexes,
	D.DateCreated
FROM DataIndexSize as D
JOIN DBNames on (D.ID=DBNames.ID);