-- VISTAS
DROP VIEW IF EXISTS colonos_por_ocupacion;
CREATE VIEW colonos_por_ocupacion AS
	SELECT COUNT(c.Id) as 'Cantidad de Colonos', ca.Nombre as 'Ocupacion'
	FROM Colono c JOIN CatalogoOcupaciones ca ON (c.Ocupacion = ca.Id)
	GROUP BY (c.Ocupacion);