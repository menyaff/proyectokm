CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_servicios`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT s.id, s.clave, 
							s.concepto, 
							cs.id AS id_subFamilia, cs.nombre AS subFamilia,
                            cf.id AS id_catFamilia, cf.nombre AS familia,
                            ca.id AS id_catArea, ca.nombre AS area,
                            s.cantidad, 
                            s.precioUnitario, 
                            (s.cantidad*s.precioUnitario) AS total
					 FROM servicios s
					 LEFT JOIN cat_areas ca ON s.area=ca.id
					 LEFT JOIN cat_familias cf ON ca.familia=cf.id
					 LEFT JOIN cat_subFamilias cs ON cf.subFamilia=cs.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE s.id=",P_id);
	END IF;
	IF((P_id IS NULL OR P_id="") AND P_filtro IS NOT NULL AND P_filtro!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
	END IF;
	IF(P_order IS NOT NULL AND P_order!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
	END IF;
	
	SET @sqlQuery = CONCAT(@sqlQuery,";");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
END