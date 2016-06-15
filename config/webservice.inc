<?php
	class webservice{
		private $parametros=array();

		public function __construct($strParametros=""){			
			$this->setParametro($strParametros);
		}

		public function setParametro($strParametros,$modo=__REQUEST__){
			$this->parseParametros($strParametros,$modo);
		}
		public function changeParametro($parametro,$valor){
			$this->parametros[$parametro] = $valor;
		}
		public function getParametro($indice=NULL){
			if(is_null($indice))
				return $this->parametros;
			else
				return $this->parametros[$indice];
		}
		public static function getRequest($indice, $modo=__REQUEST__){
			switch($modo){
				case "REQUEST":
					return isset($_REQUEST[$indice]) ? $_REQUEST[$indice] : NULL;
					break;
				case "GET":
					return isset($_GET[$indice]) ? $_GET[$indice] : NULL;
					break;
				case "POST":
					return isset($_POST[$indice]) ? $_POST[$indice] : NULL;
					break;
			}
		}
		private function parseParametros($strParametros,$modo=__REQUEST__){
			$arrParametros = explode(",",$strParametros);

			foreach($arrParametros as $parametro)
				$this->parametros[$parametro] = self::getRequest($parametro,$modo);
		}
	}
?>