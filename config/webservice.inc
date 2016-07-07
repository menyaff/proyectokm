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
			else if(is_array($indice)){
				foreach($indice as $parametro)
					$temp[$parametro] = $this->parametros[$parametro];

				return $temp;
			}else
				return $this->parametros[$indice];
		}
		public static function getRequest($indice, $modo=__REQUEST__){
			switch($modo){
				case __REQUEST__:
					return isset($_REQUEST[$indice]) ? $_REQUEST[$indice] : NULL;
					break;
				case __GET__:
					return isset($_GET[$indice]) ? $_GET[$indice] : NULL;
					break;
				case __POST__:
					return isset($_POST[$indice]) ? $_POST[$indice] : NULL;
					break;
			}
		}
		private function parseParametros($strParametros,$modo=__REQUEST__){
			$arrParametros = explode(",",$strParametros);

			foreach($arrParametros as $parametro)
				$this->parametros[$parametro] = self::getRequest($parametro,$modo);
		}

		public static function salida($resp){
			if(isset($_GET["front"]))
				pre(json_decode($resp),TRUE,"resp");
			else
				echo $resp;
		}
	}
