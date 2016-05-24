<?php
	$campos = array("nombre",
					"pass",
					"llave",
					"empleado",
					"rol"
					);
	$tipos = array("VARCHAR(50)",
					"VARCHAR(100)",
					"VARCHAR(100)",
					"INT",
					"INT"
					);

	$create="";
	$insert="";
	$update="";

	
	foreach($campos as $idx=>$dato)
		$create .= "IN P_".$dato." ".$tipos[$idx].", ";
	$create = rtrim($create,", ");

	foreach($campos as $dato)
		$insert .= "P_".$dato.",";
	$insert = rtrim($insert,",");

	foreach($campos as $dato)
		$update .= $dato."=P_".$dato.", ";
	$update = rtrim($update,", ");

	echo "CREATE<br />".$create."<br />INSERT<br />".$insert."<br />UPDATE<br />".$update;
?>