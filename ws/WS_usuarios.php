<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = webservice::getRequest("accion",__GET__);
	$respuesta = array();

	switch($accion){
		case "getLlave":
			$WS = new webservice("nuevo,nom");

			$nuevo = webservice::getRequest("nuevo",__POST__);

			if($WS->getParametro("nuevo") != NULL)
				echo json_encode(array("mensaje"=>"SUCCESS","llave"=>date("U")));
			else{
				$query = $BD->query($BD->doSP("SPQ_llaveUsuario",array($WS->getParametro("nom"))));
				$llave = $BD->fetchRow($query);

				if($llave[0]!="" && !is_null($llave[0])){
					$_SESSION["llave"] = $llave[0];
					$_SESSION["nllave"] = sha1(date("U"));

					$retorno = array(
								"mensaje" => "SUCCESS",
								"llave" => $_SESSION["llave"],
								"nllave" => $_SESSION["nllave"]
							);
				}
	            else
	                $retorno = array("mensaje" => "No se encuentra el usuario");

				echo json_encode($retorno);
			}
			break;
		case "login":
			require __PathComplementos__."cifrado.php";

			$WS = new webservice("nom,pass,npass");

			$data = array(
						"usuario" => $WS->getParametro("nom"),
						"pass" => cifrado::encrypt($WS->getParametro("pass"),$_SESSION["llave"]),
						"npass" => cifrado::encrypt($WS->getParametro("npass"),$_SESSION["nllave"]),
						"nllave" => $_SESSION["nllave"]
					);

			unset($_SESSION["llave"],$_SESSION["nllave"]);

			$query = $BD->query($BD->doSP("SPQ_loginUsuario",$data));
			$login = $BD->fetchRow($query);

			if($login[0] !== "FALSE"){
				$_SESSION["usuario"] = $login[0];

				echo json_encode(array("mensaje"=>"SUCCESS","destino"=>"clientes.php"));
			}else{
				echo json_encode(array("mensaje"=>"Contraseña incorrecta"));
			}

			break;
		case "select":
			$WS = new webservice("iId");
			
			$resp = array();

			$sql = $BD->doSP("SPQ_usuarios",$WS->getParametro());
			$query = $BD->query($sql);

			while($tupla = $BD->fetchAssoc($query))
				array_push($resp,$tupla);

			echo json_encode($resp);
			break;
		case "update":
			require __PathComplementos__."cifrado.php";

			$WS = new webservice("iId,iNombre,iPassword,iLlave,selEmpleado,selRol");

			$WS->changeParametro("iPassword",cifrado::encrypt($WS->getParametro("iPassword"),$WS->getParametro("iLlave")));

			$query = $BD->doSP("SPU_usuarios",$WS->getParametro());
			
			echo json_encode($BD->fetchAssoc($BD->query($query)));
			break;
		case "delete":
			$WS = new webservice("iId");

			$parametros = $WS->getParametro();
			$parametros["filtro"] = NULL;

			$query = $BD->doSP("SPD_usuarios",$parametros);
			
			echo json_encode($BD->fetchAssoc($BD->query($query)));
		default:
			echo "Falta definir acción";
			break;
	}
?>
