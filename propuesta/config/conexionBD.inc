<?php
    class conexionBD{
        private $HOST,$USER,$PASS,$BD,$SQL;
        
        public function __construct($host,$user,$pass,$bd,$sql){
            $this->HOST = $host;
            $this->USER = $user;
            $this->PASS = $pass;
            $this->BD = $bd;
            $this->SQL = $sql;
        }
        
        private function openBD(){
			try{
				switch($this->SQL){
					case "mysql":
						$CXN = mysql_connect($this->HOST, $this->USER, $this->PASS);
						
						if(!mysql_select_db($this->BD,$CXN)){
							errorShow("Error al seleccionar base de datos: ".mysql_error());
							
							$this->closeBD($CXN);
						}else{
							mysql_query("SET NAMES 'utf8';",$CXN);
							
							return $CXN;
						}
						break;
					case "mysqli":
						$CXN = mysqli_connect($this->HOST, $this->USER, $this->PASS, $this->BD);
                        
						if (mysqli_connect_errno()){
							errorShow("Error al conectar la BD: ".mysqli_connect_error());
						}else{						
							mysqli_query($CXN,"SET NAMES 'utf8';");
							
							return $CXN;
						}
						break;
				}
				
				return FALSE;
			}catch(Exception $e){
				errorShow($e);
				
				return FALSE;
			}
		}
		private function closeBD($CXN){
			try{
				switch($this->SQL){
					case "mysql":
						if(mysql_close($CXN))
							return TRUE;
						break;
					case "mysqli":
						if(mysqli_close($CXN))
							return TRUE;
						break;
				}
				
				return FALSE;
			}catch(Exception $e){
				errorShow($e);
				
				return FALSE;
			}
		}
		
		public function query($query){ 
            $CXN = $this->openBD();
            
			try{
                switch($this->SQL){
					case "mysql":
                        if(strcmp("INSERT",strtoupper(substr($query, 0, 6))) == 0){
                            if(mysql_query($query,$CXN))
                            	$retorno = mysql_insert_id($CXN);
                           	else
                           		errorShow("Error SQL: ".mysql_error()." Query: ".$query);
                        }else{
                            if(!($retorno = mysql_query($query,$CXN)))
                            	errorShow("Error SQL: ".mysql_error()." Query: ".$query);
                        }
						break;
					case "mysqli":
                        if(strcmp("INSERT",strtoupper(substr($query, 0, 6))) == 0){
                            if(mysqli_query($CXN,$query))
                            	$retorno = mysqli_insert_id($CXN);
                            else
                           		errorShow("Error SQL:".mysqli_error($CXN)." Query: ".$query);
                        }else{
                            if(!($retorno = mysqli_query($CXN,$query)))
                            	errorShow("Error SQL:".mysqli_error($CXN)." Query: ".$query);
                        }
						break;
				}
                
				$this->closeBD($CXN);
					
				return $retorno;
			}catch(Exception $e){
                errorShow($e->getMessage());
				errorShow("ERROR La query que falló es: ".$query);
                
                $this->closeBD($CXN);
				
				return FALSE;
			}
		}
		public function numRows($query){
			try{
				switch($this->SQL){
					case "mysql":
						return mysql_num_rows($this->query($query));
						break;
					case "mysqli":
						return mysqli_num_rows($this->query($query));
						break;
				}
				
				return FALSE;
			}catch(Exception $e){
				errorShow($e->getMessage());
				
				return FALSE;
			}
		}
		public function dataSeek($resultset,$index=0){
			try{
				switch($this->SQL){
					case "mysql":
						return mysql_data_seek($resultset,$index);
						break;
					case "mysqli":
						return mysqli_data_seek($resultset,$index);
						break;
				}
				
				return FALSE;
			}catch(Exception $e){
				errorShow($e->getMessage());
				
				return FALSE;
			}
		}
		public function fetchAssoc($resultset){
			try{
				if($resultset){
					switch($this->SQL){
						case "mysql":
							return mysql_fetch_assoc($resultset);
							break;
						case "mysqli":
							return mysqli_fetch_assoc($resultset);
							break;
					}
				}
				else
					errorShow("Se esperaba un parámetro fetchAssoc");
				
				return FALSE;
			}catch(Exception $e){
				errorShow($e->getMessage());
				
				return FALSE;
			}
		}
		public function fetchRow($resultset){
			try{
				if($resultset){
					switch($this->SQL){
						case "mysql":
							return mysql_fetch_row($resultset);
							break;
						case "mysqli":
							return mysqli_fetch_row($resultset);
							break;
					}
				}else
					errorShow("Se esperaba un parámetro fetchRow");
				
				return FALSE;
			}catch(Exception $e){
				errorShow($e->getMessage());
				
				return FALSE;
			}
		}
		public function fetchArray($resultset){
			try{
				if($resultset){
					switch($this->SQL){
						case "mysql":
							return mysql_fetch_array($resultset);
							break;
						case "mysqli":
							return mysqli_fetch_array($resultset);
							break;
					}
				}else
					errorShow("Se esperaba un parámetro fetchArray");
			}catch(Exception $e){
				errorShow($e->getMessage());
			}
		}
		public function fetchObject($resultset){
			try{
				if($resultset){
					switch($this->SQL){
						case "mysql":
							return mysql_fetch_object($resultset);
							break;
						case "mysqli":
							return mysqli_fetch_object($resultset);
							break;
					}
				}else
					errorShow("Se esperaba un parámetro fetchObject");
			}catch(Exception $e){
				errorShow($e->getMessage());
			}
		}
	}
	