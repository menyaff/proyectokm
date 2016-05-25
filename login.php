<?php
	require_once "config/front.conf";
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<meta charset="UTF-8" />
		<?php
			librerias::includeJQuery();
		?>
		<script src="js/cifrado.js"></script>
		<script>
			$(document).ready(function(){
				$("#btnAceptar").click(function(){
					$.ajax({
		                url: "<?= librerias::pathWS() ?>WS_usuarios.php?accion=getLlave",
		                dataType: "json",
		                data: {"nom":$("#iUser").val()},
		                type: "post",
		                async: true,
		                success: function(preLogin){
		                	if(preLogin.mensaje=="success"){
		                        var data = {
			                                "nom" : $("#iUser").val(),
			                                "pass" : $.base64Encode($("#iPass").val(),preLogin.llave),
			                                "npass" : $.base64Encode($("#iPass").val(),preLogin.nllave)
			                            };

		                		$.ajax({
					                url: "<?= librerias::pathWS() ?>WS_usuarios.php?accion=login",
					                dataType: "json",
					                data: data,
					                type: "post",
					                async: true,
					                success: function(login){
					                	if(preLogin.mensaje=="success"){
					                		
					                	}
					                }
		            			});
		                	}
		                }
		            });
		        });
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