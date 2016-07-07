CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_puestos`(IN P_id VARCHAR(200))
BEGIN
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_puestos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN
		SET @dependencias = 0;
		
		SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM empleados WHERE puesto IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN  
			SET @sqlQuery = CONCAT("DELETE FROM cat_puestos WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Puesto eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Puesto asignado a empleados' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el puesto' AS 'mensaje';
	END IF;
END