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
		<form action="">
			<table>
				<tr>
					<td><input type="text" id="iUser" /></td>
				</tr>
				<tr>
					<td><input type="password" id="iPass" /></td>
				</tr>
				<tr>
					<td><input type="button" id="btnAceptar" value="Aceptar" /></td>
				</tr>
			</table>
		</form>
	</body>
</html>