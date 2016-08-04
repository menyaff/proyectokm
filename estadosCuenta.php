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
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid"; 
        titulo = "estado de cuenta";

        WS =  "<?= $pathWS ?>WS_estadosCuenta.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 700);
            $(modal).setModal(titulo, 550);
            $(grid).setGrid();
        });
    </script>
</head>
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
                <input type="submit" class="btn btn-default" value="Enviar" />
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
       </form>
    </div>
    <div id="divModalDetalles" class="formPopup">
        <table class="table table-responsive">
            <tr>
                <th class="thead">Cuenta Bancaria</th>
                <td name="nombre"></td>
            </tr>
            <tr>
                <th class="thead">Banco</th>
                <td name="banco"></td>
            </tr>
            <tr>
                <th class="thead">No. Cuenta</th>
                <td name="noCuenta"></td>
            </tr>
            <tr>
                <th class="thead">CLABE</th>
                <td name="clabe"></td>
            </tr>
            <tr>
                <th class="thead">Saldo</th>
                <td name="saldo"></td>
            </tr>
            <tr>
                <th class="thead">Fecha</th>
                <td name="fecha"></td>
            </tr>
            <tr>
                <th class="thead">Monto</th>
                <td name="monto"></td>
            </tr>
            <tr>
                <th class="thead">Concepto</th>
                <td name="concepto"></td>
            </tr>
            <tr>
                <th class="thead">Movimiento</th>
                <td name="movimiento"></td>
            </tr>
        </table>
    </div>
</body>
</html>