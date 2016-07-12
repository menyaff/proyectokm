<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);

	switch($accion){
		case "select":
			$WS = new webservice("hdnId,selSubFamilias");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_cat_familias",$WS->getParametro());
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "update":
			$WS = new webservice("hdnId,iNombre,selSubFamilias");

			$query = $BD->doSP("SPU_cat_familias",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "delete":
			$WS = new webservice("hdnId");

			$query = $BD->doSP("SPD_cat_familias",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		default:
			$resp = json_encode(array("respuesta"=>"FALSE","mensaje"=>"Falta definir acción"));
			break;
	}

	webservice::salida($resp);
?>
