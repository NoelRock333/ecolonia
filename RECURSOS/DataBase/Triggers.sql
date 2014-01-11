USE eColonia2;

-- TRIGGERS

DELIMITER $$
DROP TRIGGER `actualizaNumeroDeIntegrantesEnCasa`$$
CREATE TRIGGER actualizaNumeroDeIntegrantesEnCasa 
AFTER UPDATE ON Colono
FOR EACH ROW BEGIN
	CREATE TABLE IF NOT EXISTS ColonosLog(
		Id INT NOT NULL AUTO_INCREMENT,
		usuario VARCHAR(40),
		fecha DATETIME,
		agregado INT NOT NULL,
		CONSTRAINT PK_ColonosLog PRIMARY KEY (Id)
	);

	INSERT INTO ColonosLog VALUES (USER(), NOW(), NEW.Id);
END$$
DELIMITER ;
