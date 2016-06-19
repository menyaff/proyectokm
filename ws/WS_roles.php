<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);
	$respuesta = array();

	switch($accion){
		case "select":
			$WS = new webservice("hdnId");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_cat_roles",$WS->getParametro());
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "update":
			$WS = new webservice("hdnId,iNombre");

			$query = $BD->doSP("SPU_cat_roles",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "delete":
			$WS = new webservice("hdnId");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_cat_roles",$parametros);
			
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
