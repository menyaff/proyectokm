<?php
	include "../complementos/firePHP/fb.php";

	if($con = mysqli_connect("localhost","root","","kmasociados"))
		echo "SI";
	else
		echo "NO";

	FB::info($con);

	$sql = mysqli_query($con,"SELECT * FROM usuarios;");
	FB::info($sql);
	while($tupla = mysqli_fetch_array($sql))
		echo $tupla["nombre"]."<br>";
?>