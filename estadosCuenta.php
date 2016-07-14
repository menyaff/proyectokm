<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Estado de Cuenta</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();
    ?>
    <script>
        templateID = "";
        templateBotones = "";
    </script>
    <script src="<?= $pathJS ?>forms.js"></script>
    <script src="<?= $pathJS ?>grids.js"></script>
    <script>
        jsonFields = {
                        nombre: { type: "string" },
                        banco: { type: "string" },
                        noCuenta: { type: "string" },
                        fechaGasto: { type: "string" },
                        gasto: { type: "string" },
                        fechaCobro: { type: "string" },
                        cobro: { type: "string" }
                    };
        jsonColumns = [
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "banco",
                            title: "Banco"
                        },
                        {
                            field: "noCuenta",
                            title: "No. Cuenta"
                        },
                        {
                            field: "fechaGasto",
                            title: "Fecha de Gasto"
                        },
                        {
                            field: "gasto",
                            title: "Gasto"
                        },
                        {
                            field: "fechaCobro",
                            title: "Fecha de Cobro"
                        },
                        {
                            field: "cobro",
                            title: "Cobro"
                        }
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_estadosCuenta.php";
        $(document).ready(function(){
            $(modal).setModal("banco", 550);
            $(grid).setGrid();
        });
    </script>
</head>
<body>
<body>
    <div id="wrapper">
        <?php menuPrincipal(); ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <!-- mapa ubicación -->
                <div class="row">
                    <?php breadcrumb(); ?>
                </div>
            <!-- /mapa ubicación -->
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup">
        <form method="post">
            <div class="form-group">
                <input type="hidden" name="id" id="hdnId" value="0"/>
                <input type="text" name="nombre" id="iNombre" class="form-control form-md" placeholder="Nombre">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-default">Enviar</button>
                <button type="reset" class="btn btn-default">Limpiar</button>
            </div>
       </form>
    </div>
</body>
</html>