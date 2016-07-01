CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_servicios`(IN P_id VARCHAR(200))
BEGIN
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @dependencias = 0;
		
		SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM serviciosEventos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN          
			SET @sqlQuery = CONCAT("DELETE FROM servicios WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Servicio eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Servicio asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el servicio' AS 'mensaje';
	END IF;
END