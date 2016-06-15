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
		<script src="<?= $pathJS ?>cifrado.js"></script>
		<script>
			$(document).ready(function(){
				$("#divFormLogin").submit(function(){
					$.ajax({
		                url: "<?= $pathWS ?>WS_usuarios.php?accion=getLlave",
		                dataType: "json",
		                data: {"nom":$("#iUser").val()},
		                type: "post",
		                async: true,
		                success: function(preLogin){
		                	if(preLogin.mensaje=="SUCCESS"){
		                        var data = {
			                                "nom" : $("#iUser").val(),
			                                "pass" : $.base64Encode($("#iPass").val(),preLogin.llave),
			                                "npass" : $.base64Encode($("#iPass").val(),preLogin.nllave)
			                            };

		                		$.ajax({
					                url: "<?= $pathWS ?>WS_usuarios.php?accion=login",
					                dataType: "json",
					                data: data,
					                type: "post",
					                async: true,
					                success: function(login){
					                	if(login.mensaje=="SUCCESS"){
					                		
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
	            <input type="submit" id="btnAceptar" value="Iniciar Sesi&oacute;n" />
	        </form>
	    </div>
	</body>
</html>