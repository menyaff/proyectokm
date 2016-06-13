<?php
    require_once "config/front.conf";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Subfamilias</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();
    ?>
    <link type="text/css" rel="stylesheet" href="<?= $pathCSS ?>main.css" />
    <link type="text/css" rel="stylesheet" href="<?= $pathCSS ?>formularios.css" />
    <style type="text/css">
        #divFormSubfamilias{ display: none; }
    </style>
    <script>
        templateID = "";
        templateBotones = "";
    </script>
    <script src="<?= $pathJS ?>forms.js" ></script>
    <script src="<?= $pathJS ?>grids.js" ></script>
    <script>
        jsonFields = {
                        id: { type: "number" },
                        nombre: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        templateBotones
                    ];
        modal = "#divFormSubfamilias"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_subfamilias.php";

        $(document).ready(function(){
            $(modal).setModal("subfamilia", 550);
            $(grid).setGrid();
        });
    </script>
</head>
<body>
    <div id="wrapper">
        <?php include 'menu.php'; ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <!-- mapa ubicación -->
                <div class="row">
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.php"><span class="fa fa-fw fa-home"></span> Inicio</a>
                        </li>
                        <li class="active">
                            Familias
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divFormSubfamilias">
        <form>
            <div class="form-group">
                <input type="text" id="iNombre" name="nombre" class="form-control campoNombre" placeholder="Nombre" />
                <input type="hidden" id="iId" name="id" value="0" />
            </div>
            <div class="text-center">
                <input type="button" id="btnAceptar" class="btn btn-default" value="Aceptar" />
                &nbsp;
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
        </form>
    </div>
</body>
</html>