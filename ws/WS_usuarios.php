<?php
	include_once "../config/back.conf";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$accion = isset($_REQUEST["accion"]) ? $_REQUEST["accion"] : NULL;

	switch($accion){
		case "getLlave":
			if(isset($_POST["nuevo"]))
				echo json_encode(array("llave"=>date("U")));
			else{
				$nom = isset($_POST["nom"]) ? $_POST["nom"] : NULL;

				$query = $BD->query("CALL SPQ_llaveUsuario('".$nom."');");
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
			}
			break;
		case "login":
			require __PathComplementos__."cifrado.php";

			$nom = isset($_POST["nom"]) ? $_POST["nom"] : NULL;
			$pass = isset($_POST["pass"]) ? $_POST["pass"] : NULL;
			$npass = isset($_POST["npass"]) ? $_POST["npass"] : NULL;

			$data = array(
						"usuario" => $nom,
						"nllave" => $_SESSION["nllave"],
						"pass" => cifrado::encrypt($pass,$_SESSION["llave"]),
						"npass" => cifrado::encrypt($npass,$_SESSION["nllave"])
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
			$iId = isset($_POST["iId"]) ? $_POST["iId"] : "NULL";

			if($iId!="NULL")
				require __PathComplementos__."cifrado.php";

			$iNombre = isset($_POST["iNombre"]) ? $_POST["iNombre"] : "NULL";
			$iLlave = isset($_POST["iLlave"]) ? $_POST["iLlave"] : "NULL";
			$iPassword = isset($_POST["iPassword"]) ? cifrado::encrypt($_POST["iPassword"],$iLlave) : "NULL";
			$selEmpleado = isset($_POST["selEmpleado"]) ? $_POST["selEmpleado"] : "NULL";
			$selRol = isset($_POST["selRol"]) ? $_POST["selRol"] : "NULL";

			echo "CALL SPU_usuarios(".$iId.",'".$iNombre."','".$iPassword."','".$iLlave."',".$selEmpleado.",".$selRol.");";

			$query = $BD->query("CALL SPU_usuarios(".$iId.",'".$iNombre."','".$iPassword."','".$iLlave."',".$selEmpleado.",".$selRol.");");
			$resultado = $BD->fetchAssoc($query);
			FB::info($resultado);
			break;
		default:
			echo "Falta definir acción";
			break;
	}
?>
