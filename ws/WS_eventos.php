<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);

	switch($accion){
		case "selectCotizacion":
			$WS = new webservice("hdnId,filtro,order");
			$WS->changeParametro("filtro","cotizacion=1");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_eventos",$WS->getParametro());
			
			$query = $BD->query($sql);

			while($tupla = $BD->fetchArray($query,MYSQLI_ASSOC)){
				$tupla["id_status"] = $tupla["id_catStatusCotizacion"];
				$tupla["status"] = $tupla["statusCotizacion"];

				array_push($resp,$tupla);
			}	

			$resp = json_encode($resp);
			break;
		case "selectEvento":
			$WS = new webservice("hdnId,filtro,order");
			$WS->changeParametro("filtro","cotizacion=0");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_eventos",$WS->getParametro());
			
			$query = $BD->query($sql);

			while($tupla = $BD->fetchArray($query,MYSQLI_ASSOC)){
				$tupla["id_status"] = $tupla["id_catStatusEvento"];
				$tupla["status"] = $tupla["statusEvento"];

				array_push($resp,$tupla);
			}	

			$resp = json_encode($resp);
			break;
		case "selectArticulo":
			$WS = new webservice("hdnId,idEvento,order");

			$query = $BD->query($BD->doSP("SPQ_articulosEventos",$WS->getParametro()));
	
			$resp = array();

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "selectServicio":
			$WS = new webservice("hdnId,filtro,order");

			$query = $BD->query($BD->doSP("SPQ_serviciosEventos",$WS->getParametro()));
	
			$resp = array();

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			$resp = json_encode($resp);
			break;
		case "update":
			$WS = new webservice("hdnIdArticuloEvento, iNombre, chCotizacion, statusCotizacion, statusEvento, selClientes, selLugares, selTipos, iFechaEntrega, iFechaSeguimiento, iFechaFinal, iDireccion, iInvitados, rdSalon, selVendedores, iUtilidadCuenta, iCuenta, iMontoServicios, selDepositosEnGarantia, iMontoDepositosEnGarantia, selGuardias, iCantidadGuardias, iMontoGuardias, selMetodosPago, selCuentasBancarias, iTotalEvento, iAnticipo");

			if($WS->getParametro("chCotizacion")=="TRUEb")
				$WS->changeParametro("statusCotizacion",webservice::getRequest("selStatus"));
			else
				$WS->changeParametro("statusEvento",webservice::getRequest("selStatus"));

			$query = $BD->doSP("SPU_eventos",$WS->getParametro());
			
			$resultadoEventos = $BD->fetchAssoc($BD->query($query));

			/*if($resultadoEventos["respuesta"]=="TRUE" && $WS->getParametro("hdnIdArticuloEvento")=="0"){
				$articulos = $WS->getParametro("arrArticulos");
				$servicios = $WS->getParametro("arrServicios");
				$errorRelacionados = "";

				if(!is_null($articulos)){
					$inserts = implode("),(",$articulos);
					$inserts = "(".$inserts.")";

					$resultadoArticulos = $BD->fetchAssoc($BD->query($BD->doSP("SPI_articulosEventosMasivo",$inserts)));

					if($resultadoArticulos["respuesta"]=="FALSE")
						$errorRelacionados = "artículos";
				}

				if(!is_null($servicios)){
					$inserts = implode("),(",$servicios);
					$inserts = "(".$inserts.")";

					$resultadoServicios = $BD->fetchAssoc($BD->query($BD->doSP("SPI_serviciosEventosMasivo",$inserts)));

					if($resultadoServicios["respuesta"]=="FALSE")
						$errorRelacionados .= " servicios";
				}

				if($errorRelacionados == "")
					$resp = json_encode($resultadoEventos);
				else
					$resp = json_encode(array("respuesta"=>"TRUE","mensaje"=>"Evento agregado correctamente con error en".trim($errorRelacionados)));
			}else*/
				$resp = json_encode($resultadoEventos);
			break;
		case "asignaArticulo":
			$WS = new webservice("hdnId, iCantidad, selArticulos, hdnIdEvento");
			if(!is_null(webservice::getRequest("cotizacion")))
				$WS->changeParametro("hdnIdEvento",webservice::getRequest("cotizacion"));
			if(!is_null(webservice::getRequest("evento")))
				$WS->changeParametro("hdnIdEvento",webservice::getRequest("evento"));

			$query = $BD->doSP("SPU_articulosEventos",$WS->getParametro());
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "asignaServicio":
			$WS = new webservice("selServicios, hdnIdEvento");

			if($WS->getParametro("hdnIdEvento")!="0"){
				$query = $BD->doSP("SPU_serviciosEventos",$WS->getParametro());
				
				$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			}else
				exit;
			break;
		case "delete":
			$WS = new webservice("hdnIdArticulo");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_eventos",$parametros);
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "eliminaArticulo":
			$WS = new webservice("hdnId");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_articulosEventos",$parametros);
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "eliminaServicio":
			$WS = new webservice("hdnId");

			$parametros = $WS->getParametro();

			$query = $BD->doSP("SPD_serviciosEventos",$parametros);
			
			$resp = json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "purgaArticulos":
			$BD->query($BD->doSP("SPD_purgaArticulosEventos"));	

			$resp = json_encode(array("respuesta"=>"TRUE","mensaje"=>"Purgado OK"));
			break;
		default:
			$resp = json_encode(array("respuesta"=>"FALSE","mensaje"=>"Falta definir acción"));
			break;
	}

	webservice::salida($resp);
?>
