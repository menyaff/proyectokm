<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Vendedores</title>
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
                        empleado: { type: "string" },
                        ranking: { type: "string" },
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "empleado",
                            title: "Empleado"
                        },
                        {
                            field: "ranking",
                            title: "Ranking"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_vendedores.php";

        $(document).ready(function(){
            $(modal).setModal("vendedor", 450);
            $(grid).setGrid();
            $("#selEmpleados").rellenaSelect("<?= $pathWS ?>WS_empleados.php");
            $("#selRankings").rellenaSelect("<?= $pathWS ?>WS_ranking.php");
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
                <select name="id_empleado" id="selEmpleados" class="form-control form-sm">
                    <option value="" selected disabled>Empleado...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_ranking" id="selRankings" class="form-control form-sm">
                    <option value="" selected disabled>Ranking...</option>
                </select>
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-default" value="Enviar" />
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
       </form>
    </div>
</body>
</html>