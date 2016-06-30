<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);
	$respuesta = array();

	switch($accion){
		case "select":
			$WS = new webservice("hdnId,filtro,order");
			$resp = array();

			$sql = $BD->doSP("SPQ_proveedores",$WS->getParametro());
			FB::info($sql);
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "update":
			$WS = new webservice("hdnId,iClave,iNombre,iNombreContacto,iNombre2Contacto,iNombreEmpresaContacto,iTelefonoContacto,iCelularContacto,iEmailContacto,iWebContacto,iRfcFiscal,iNombreComercialFiscal,iCalleFiscal,iColoniaFiscal,selCiudadFiscal,selEstadoFiscal,iCodigoPostalFiscal");
			//FB::log($WS);

			$query = $BD->doSP("SPU_proveedores",$WS->getParametro());
			FB::log($query);
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			//FB::info($resp);
			break;
		case "delete":
			$WS = new webservice("hdnId");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_proveedores",$parametros);
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		default:
			$resp = json_encode(array("respuesta"=>"FALSE","mensaje"=>"Falta definir acción"));
			break;
	}

	if(isset($_GET["front"]))
		pre(json_decode($resp),TRUE,"resp");
	else
		echo $resp;
?>
