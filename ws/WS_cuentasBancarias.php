<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);

	switch($accion){
		case "select":
			$WS = new webservice("hdnId,filtro,order");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_cuentasBancarias",$WS->getParametro());
			
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "update":
			$WS = new webservice("hdnId,iClave,iNombre,selBancos,iNoCuenta,iClabe,iSaldo");

			$query = $BD->doSP("SPU_cuentasBancarias",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "delete":
			$WS = new webservice("hdnId");

			$query = $BD->doSP("SPD_cuentasBancarias",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "estadoDeCuenta":
			$WS = new webservice("hdnId,iFechaIni,iFechaFin");

			$sql = $BD->doSP("SPQ_estadoDeCuenta",$WS->getParametro());

			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query)){
				if(!isset($resp["cuentaBancaria"])){
					$resp["cuentaBancaria"]["nombre"] = $tupla["nombre"];
					$resp["cuentaBancaria"]["banco"] = $tupla["banco"];
					$resp["cuentaBancaria"]["noCuenta"] = $tupla["noCuenta"];
					$resp["cuentaBancaria"]["clabe"] = $tupla["clabe"];
					$resp["cuentaBancaria"]["saldo"] = $tupla["saldo"];
				}

				$resp["movimientos"][] = array("fecha"=>$tupla["fecha"],"monto"=>$tupla["monto"],"concepto"=>$tupla["concepto"],"movimiento"=>$tupla["movimiento"]);
			}

			$resp = json_encode(isset($resp) ? array("respuesta"=>"TRUE","contenido"=>$resp) : array("respuesta"=>"FALSE","mensaje"=>"No se encontró información para la cuenta bancaria"));
			break;
		default:
			$resp = json_encode(array("respuesta"=>"FALSE","mensaje"=>"Falta definir acción"));
			break;
	}

	webservice::salida($resp);
?>
