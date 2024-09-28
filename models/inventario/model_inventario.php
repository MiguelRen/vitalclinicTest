<?php
    class Model_Inventario_productos extends Connection{ 

        private $con ;

        public function __construct(){
            $this-> con = $this->connect() ;
        }

        public function extraer_producto() {
                        $sql = "select * from articulos where art=?";
                        $queryResult = $this->con->query($sql);
                        die(var_dump(value: $queryResult));
                        // return $queryResult;

        }
    }
?>