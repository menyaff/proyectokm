<?php
	include_once "../config/back.conf";
	require_once "../config/webservice.inc";

	$BD = new conexionBD(__BDHost__,__BDUser__,__BDPass__,__BDDatabase__,__SQL__);

	$query = $BD->query("SELECT * FROM cat_ciudades WHERE estado=10;");

	while($tupla = $BD->fetchAssoc($query))
		echo $tupla["nombre"]."<br />";
?>