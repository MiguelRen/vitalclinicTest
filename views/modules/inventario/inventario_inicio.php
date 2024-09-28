<?php
include "./views/modules/header.php"
    ?>


<div name="contenido">
    <br>
    <div name="headerPart">
        <h1 class="text-lg text-center text-white font-extraboldmb-4 text-4xl 
        font-extrabold tracking-tight leading-none text-gray-900 md:text-5xl 
        lg:text-6xl dark:text-white">Inventario de Productos</h1>
    </div>

    <div name="BodyPart">

        <div name="productFinder">

            <br>
            <br>
            <form class="max-w-sm mx-auto" id="codigoProducto">
                <div class="mb-5">
                    <label for="email"
                        class="block mb-2 text-lg text-white font-medium text-gray-900 dark:text-white">Ingrese un
                        código de producto</label>
                    <input type="number" id="codigoProducto" name="codigoProducto"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Código del producto aquí" required />
                </div>

                <button type="submit"
                    class=" text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
            </form>

        </div>

        <br>
        <br>
        <br>
        <div name="lastChanges">
            <table class="table mx-auto">

                <caption>Últimos Cambios</caption>

                <t-head class="t-head">
                    <tr>
                        <th>Codigo</th>
                        <th>Descripción</th>
                        <th>Tipo Movimiento</th>
                        <th>Cant. movimiento</th>
                        <th>Cant.Total</th>
                    </tr>
                </t-head>
                <t-body class="t-body">

                </t-body>
            </table>

        </div>

    </div>

</div>

<script src="./views/assets/js/inventario/inventarioApi.js" type="module"></script>
