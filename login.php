<?php
    require_once "config/front.conf";
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<?php
			metatags();
			librerias::JQuery();
			librerias::notify();
			librerias::Bootstrap();
		?>
		<link rel="stylesheet" href="<?= $pathCSS ?>login.css">
		<script src="<?= $pathJS ?>cifrado.js"></script>
		<script>
			$(document).ready(function(){
				$("#divFormLogin").submit(function(){
					$.ajax({
		                url: "<?= $pathWS ?>WS_usuarios.php?accion=getLlave&sessionFree",
		                dataType: "json",
		                data: {"nom":$("#iUser").val()},
		                type: "post",
		                async: true,
		                success: function(preLogin){
		                	if(preLogin.respuesta=="TRUE"){
		                        var data = {
			                                "nom" : $("#iUser").val(),
			                                "pass" : $.base64Encode($("#iPass").val(),preLogin.llave),
			                                "npass" : $.base64Encode($("#iPass").val(),preLogin.nllave)
			                            };

		                		$.ajax({
					                url: "<?= $pathWS ?>WS_usuarios.php?accion=login&sessionFree",
					                dataType: "json",
					                data: data,
					                type: "post",
					                async: true,
					                success: function(login){
					                	if(login.respuesta=="TRUE"){
					                		window.location.href = login.destino;
					                	}else
		                					$.notify(login.mensaje,"error")
					                }
		            			});
		                	}else
		                		$.notify(preLogin.mensaje,"error")
		                }
		            });

					return false;
		        });
	        });
		</script>
	</head>
	<body>
		<div id="divFormLogin" class="form">
	        <div class="logo"><img src="img/logo.jpg"/></div>
	        <form>
	            <input type="text" placeholder="Usuario" id="iUser" maxlength="50" required/>
	            <input type="password" placeholder="Contrase&ntilde;a" id="iPass" maxlength="20" required/>
	            <button type="submit" id="btnAceptar">Iniciar Sesi&oacute;n</button>

	        </form>
	    </div>
	</body>
</html>