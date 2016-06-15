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
				$("#btnAceptar").click(function(){
					$.login();
				});
				$("input").keyup(function(event){
					var tecla = event.keyCode ? event.keyCode : event.which;

					if(tecla==13)
						$.login();
				});

				$.login = function(){
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
		        };
	        });
		</script>
	</head>
	<body>
		<div class="form">
	        <div class="logo"><img src="img/logo.jpg"/></div>
	        <form class="login-form" method="POST" action="<?= $_SERVER['PHP_SELF'] ?>">
	            <input type="text" placeholder="usuario" name="iUser" maxlength="50" minlength="5" required/>
	            <input type="password" placeholder="contraseña" name="iPass" maxlength="20" minlength="8" required/>
	            <button type="submit" name="btnLogin">Iniciar Sesión</button>
	        </form>
	    </div>
	</body>
</html>