CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_proveedores`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(100), IN P_nombreContacto VARCHAR(100), IN P_nombre2Contacto VARCHAR(100), IN P_nombreEmpresaContacto VARCHAR(100), IN P_telefonoContacto VARCHAR(14), IN P_celularContacto VARCHAR(14), IN P_emailContacto VARCHAR(70), IN P_webContacto VARCHAR(200), IN P_rfcFiscal VARCHAR(14), IN P_nombreComercialFiscal VARCHAR(100), IN P_calleFiscal VARCHAR(50), IN P_coloniaFiscal VARCHAR(100), IN P_ciudadFiscal INT(11), IN P_codigoPostalFiscal CHAR(5))
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO proveedores VALUES (0,P_clave,P_nombre,P_nombreContacto,P_nombre2Contacto,P_nombreEmpresaContacto,P_telefonoContacto,P_celularContacto,P_emailContacto,P_webContacto,P_rfcFiscal,P_nombreComercialFiscal,P_calleFiscal,P_coloniaFiscal,P_ciudadFiscal,P_codigoPostalFiscal);
	
        SELECT 'TRUE' AS respuesta, 'Proveedor agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM proveedores WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM proveedores WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de proveedor ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM proveedores WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de proveedor ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE proveedores SET clave=P_clave, nombre=P_nombre, nombreContacto=P_nombreContacto, nombre2Contacto=P_nombre2Contacto, nombreEmpresaContacto=P_nombreEmpresaContacto, telefonoContacto=P_telefonoContacto, celularContacto=P_celularContacto, emailContacto=P_emailContacto, webContacto=P_webContacto, rfcFiscal=P_rfcFiscal, nombreComercialFiscal=P_nombreComercialFiscal, calleFiscal=P_calleFiscal, coloniaFiscal=P_coloniaFiscal, ciudadFiscal=P_ciudadFiscal, codigoPostalFiscal=P_codigoPostalFiscal WHERE id=P_id;
			
			SELECT 'TRUE' AS respuesta, 'Proveedor actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el proveedor' AS 'mensaje';
		END IF;
    END IF;
END