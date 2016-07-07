<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);

	switch($accion){
		case "select":
			$WS = new webservice("hdnId,filtro,order");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_modulos",$WS->getParametro());
			FB::info($sql);
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "selectAsignados":
			$WS = new webservice("hdnId,filtro,order");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_rolesModulos",$WS->getParametro());
			FB::info($sql);
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "update":
			$WS = new webservice("hdnId, iNombre, iUrl, iPrioridad");

			$query = $BD->doSP("SPU_modulos",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "asignar":
			$WS = new webservice("selRoles, selModulos");

			$query = $BD->doSP("SPU_rolesModulos",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "delete":
			$WS = new webservice("hdnId");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_modulos",$parametros);
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "desAsigna":
			$WS = new webservice("hdnId");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_rolesModulos",$parametros);
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		default:
			$resp = json_encode(array("respuesta"=>"FALSE","mensaje"=>"Falta definir acción"));
			break;
	}

	webservice::salida($resp);
?>
