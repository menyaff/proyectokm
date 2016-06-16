<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);
	$respuesta = array();

	switch($accion){
		case "select":
			$WS = new webservice("iId");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_cat_guardias",$WS->getParametro());
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "update":
			$WS = new webservice("iId,iNombre");

			$query = $BD->doSP("SPU_cat_guardias",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "delete":
			$WS = new webservice("iId");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_cat_guardias",$parametros);
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		default:
			$resp = "Falta definir acción";
			break;
	}

	if(isset($_GET["front"]))
		pre(json_decode($resp),TRUE,"resp");
	else
		echo $resp;
?>
