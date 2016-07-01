CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_servicios`(IN P_id INT, IN P_clave VARCHAR(20), IN P_concepto VARCHAR(200), IN P_area INT(11), IN P_cantidad INT(11), IN P_precioUnitario NUMERIC(11,2))
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO servicios VALUES (0,P_clave,P_concepto,P_area,P_cantidad,P_precioUnitario);
	
        SELECT 'TRUE' AS respuesta, 'Servicio agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE concepto=P_concepto AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Concepto de servicio ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de servicio ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE servicios SET clave=P_clave, concepto=P_concepto, area=P_area, cantidad=P_cantidad, precioUnitario=P_precioUnitario WHERE id=P_id;
    
			SELECT 'TRUE' AS respuesta, 'Servicio actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el servicio' AS 'mensaje';
		END IF;
    END IF;
END