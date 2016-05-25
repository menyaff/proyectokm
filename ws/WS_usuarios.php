<?php
	include_once "../config/back.conf";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = $_REQUEST["accion"];

	switch($accion){
		case "getLlave":
			$query = $BD->query("CALL SPQ_llaveUsuario('".$_POST["nom"]."');");
			$llave = $BD->fetchRow($query);

			if($llave[0]!="" && !is_null($llave[0])){
				$_SESSION["llave"] = $llave[0];
				$_SESSION["nllave"] = sha1(date("U"));

				$retorno = array(
							"mensaje" => "success",
							"llave" => $_SESSION["llave"],
							"nllave" => $_SESSION["nllave"]
						);
			}
            else
                $retorno = array("mensaje" => "No se encuentra el usuario");

			echo json_encode($retorno);
			break;
		case "login":
			require __PathComplementos__."cifrado.php";

			$data = array(
						"usuario" => $_POST["nom"],
						"nllave" => $_SESSION["nllave"],
						"pass" => cifrado::encrypt($_POST["pass"],$_SESSION["llave"]),
						"npass" => cifrado::encrypt($_POST["npass"],$_SESSION["nllave"])
					);

			unset($_SESSION["llave"],$_SESSION["nllave"]);

			$query = $BD->query("CALL SPQ_loginUsuario('".$data["usuario"]."','".$data["pass"]."','".$data["npass"]."','".$data["nllave"]."');");
			$login = $BD->fetchRow($query);

			if($login[0] !== "FALSE"){
				$_SESSION["usuario"] = $login[0];

				echo json_encode(array("mensaje"=>"SUCCESS","destino"=>"clientes.php"));
			}else{
				echo json_encode(array("mensaje"=>"Contraseña incorrecta"));
			}

			break;
		case "update":
			$iIdUsuario = isset($_POST["iIdUsuario"]) ? $_POST["iIdUsuario"] : NULL;

			$query = $BD->query("CALL SPU_usuarios(".$_POST["iIdUsuario"].")
			break;
	}
?>