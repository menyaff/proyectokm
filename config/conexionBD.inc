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
                        }else
                            if(!($retorno = mysql_query($query,$CXN)))
                            	errorShow("Error SQL: ".mysql_error()." Query: ".$query);
						break;
					case "mysqli":
                        if(strcmp("INSERT",strtoupper(substr($query, 0, 6))) == 0){
                            if(mysqli_query($CXN,$query))
                            	$retorno = mysqli_insert_id($CXN);
                            else
                           		errorShow("Error SQL:".mysqli_error($CXN)." Query: ".$query);
                        }else
                            if(!($retorno = mysqli_query($CXN,$query)))
                            	errorShow("Error SQL:".mysqli_error($CXN)." Query: ".$query);
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
		public function lastIdInserted(){
			$CXN = $this->openBD();

			try{
                switch($this->SQL){
					case "mysql":
                        $return = mysql_insert_id($CXN);
						break;
					case "mysqli":
                        $return = mysqli_insert_id($CXN);
						break;
				}
                
				$this->closeBD($CXN);
					
				return $retorno;
			}catch(Exception $e){
                errorShow($e->getMessage());
                
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
		public function fetchArray($resultset,$tipo=MYSQLI_BOTH){
			try{
				if($resultset){
					switch($this->SQL){
						case "mysql":
							return mysql_fetch_array($resultset,$tipo);
							break;
						case "mysqli":
							return mysqli_fetch_array($resultset,$tipo);
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
		public function doSP($SP, $parametros=array()){
			$query = "CALL ".$SP."(";

			foreach($parametros as $parametro){
				if(is_null($parametro))
					$query .= "NULL";
				else if(is_numeric($parametro))
					$query .= $parametro;
				else if($parametro==="TRUEb" || $parametro==="FALSEb")
					$query .= rtrim($parametro,"b");
				else
					$query .= "'".$parametro."'";

				$query .= ",";
			}

			$query = rtrim($query,",").");";

			return $query;
		}
		public function doSelect($tabla, $campos="*", $join=NULL, $where=NULL, $group=NULL, $order=NULL, $limit=NULL){
			$query = "SELECT ";

			if(is_null($campos) || $campos=="*")
				$query .= "* ";	
			else{
				foreach($campos as $campo)
					$query .= $campo.",";

				$query = rtrim($query,",")." ";
			}		

			$query .= "FROM ".$tabla." ";

			if(!is_null($join))
				foreach($join as $elemento)
					$query .= $elemento[0]." JOIN ".$elemento[1]." ON ".$elemento[2]." ";
			if(!is_null($where)){
				$query .= "WHERE ";

				foreach($where as $elemento)
					$query .= $elemento." AND ";

				$query = rtrim($query,"AND ")." ";

			}
			if(!is_null($group)){
				$query .= "GROUP BY ";

				foreach($group as $elemento)
					$query .= $elemento.",";

				$query = trim($query,",")." ";
			}
			if(!is_null($order)){
				$query .= "ORDER BY ";
				
				foreach($order as $elemento)
					$query .= $elemento.",";

				$query = trim($query,",")." ";
			}
			if(!is_null($limit))
				$query .= "LIMIT ".$limit;

			$query = rtrim($query," ").";";

			return $query;
		}
		public function doInsert($tabla, $values, $campos=NULL){
			$query = "INSERT INTO ".$tabla." ";

			if(!is_null($campos)){
				$query .= "(";

				foreach($campos as $campo)
					$query .= $campo.",";

				$query = rtrim($query,",").") ";
			}
			$query .= "VALUES ";
			foreach($values as $value){
				$query .= "(";

				foreach($value as $elemento)
					$query .= "'".$elemento."',";

				$query = rtrim($query,",")."),";
			}

			$query = rtrim($query,",").";";

			return $query;
		}
		public function doDelete($tabla, $where=NULL){
			$query = "DELETE FROM ".$tabla." ";

			if(!is_null($where)){
				$query .= "WHERE ";

				foreach($where as $elemento)
					$query .= $elemento." AND ";

				$query = rtrim($query,"AND ")." ";

			}

			$query = rtrim($query).";";

			if(__SAFEMODE__ && is_null($where))
				return "Se  está ejecutando el modo seguro de BD, es necesario el uso del atributo WHERE en la consulta: \"".$query."\"";
			else
				return $query;
		}
		public function doUpdate($tabla,$set,$where=NULL){
			$query = "UPDATE ".$tabla." SET ";

			foreach($set as $index=>$value)
				$query .= $index."=".$value.",";

			$query = trim($query,",")." ";

			if(!is_null($where)){
				$query .= "WHERE ";

				foreach($where as $elemento)
					$query .= $elemento." AND ";

				$query = rtrim($query,"AND ");
			}

			$query = rtrim($query," ").";";

			if(__SAFEMODE__ && is_null($where))
				return "Se  está ejecutando el modo seguro de BD, es necesario el uso del atributo WHERE en la consulta: \"".$query."\"";
			else
				return $query;
		}
	}
	