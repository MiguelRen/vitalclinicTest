<?php

include "../../models/inventario/model_inventario.php";

    class ProductosControlers{

        public function extraer_productos($cod_producto=""){
            $model = new Model_Inventario_productos;
            $data = $model->extraer_producto();
        }
    };
