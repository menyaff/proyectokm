<?php
	$menus = array(
					"inicio",
					"menu 1",
					"menu 2" => array(
									"menu 2.1",
									"menu 2.2"
								),
					"menu 3",
					"menu 4" => array(
									"menu 4.1",
									"menu 4.2",
									"menu 4.3",
									"menu 4.4" => array(
													"menu 4.4.1",
													"menu 4.4.2"
												),
									"menu 4.5"
								),
					"menu 5"=> array(
									"menu 5.1"
								),
					"menu 6"
				);

	/*echo "<pre>";
	print_r($menus);
	echo "</pre>";*/

	/*$html = menusa($menus);

	echo $html;*/

	echo $_SERVER["DOCUMENT_ROOT"]."/subfamilias.php<br>";
	echo dirname(__FILE__)."<br>";
	echo __FILE__."<br>";
	echo getcwd()."<br>";
	echo $_SERVER["PHP_SELF"];

	function menusa($obj){
		$retorno = "<ul>";

		foreach($obj as $elem=>$value)
			if(is_array($value))
				$retorno .= "<li>".$elem.menusa($value)."</li>";
			else
				$retorno .= "<li>".$value."</li>";
		
		$retorno .= "</ul>";

		return $retorno;
	}
?>