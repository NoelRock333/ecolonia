DELIMITER $$
USE eColonia2$$
DROP PROCEDURE IF EXISTS `verificarUsuario`$$
CREATE PROCEDURE verificarUsuario (
	IN Nombre	varchar(40),
	IN AP 		varchar(40),
	IN AM		varchar(40)
)

BEGIN
	SELECT COUNT(Id)
	FROM Colono c 
	WHERE c.Nombre = Nombre && c.ApellidoPaterno = AP && c.ApellidoMaterno = AM;
END$$
DELIMITER ;
-- CALL verificarUsuario('Oscar', 'Cisneros', 'Larios');

DELIMITER $$
USE eColonia2$$ 
DROP PROCEDURE IF EXISTS `agregarOcupacion`$$
CREATE PROCEDURE agregarOcupacion(
	IN 	Ocupacion 	VARCHAR(50)
)

BEGIN
	INSERT INTO CatalogoOcupaciones 
	VALUES (Ocupacion);
END$$
DELIMITER ;
-- CALL agregarOcupacion('Policia');

DELIMITER $$
USE eColonia2$$
DROP PROCEDURE IF EXISTS `darBajaAColono`$$
CREATE PROCEDURE darBajaAColono(
	IN N 		VARCHAR(30),
	IN AP			VARCHAR(30),
	IN AM			VARCHAR(30)
)

BEGIN
	DELETE 
	FROM Colono 
	WHERE Nombre = N && ApellidoPaterno = AP && ApellidoMaterno = AM;
END$$
DELIMITER ;
-- CALL darBajaAColono('Oscar', 'Cisneros', 'Larios');