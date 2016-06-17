<?php
    require_once "config/front.conf";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Familias</title>
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
    <script>
        templateID = "";
        templateBotones = "";
    </script>
    <script src="<?= $pathJS ?>forms.js"></script>
    <script src="<?= $pathJS ?>grids.js"></script>
    <script>
        jsonFields = {
                        id: { type: "number" },
                        nombre: { type: "string" },
                        subfamilia: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "subfamilia",
                            title: "Subfamilia"
                        },
                        templateBotones
                    ];
        modal = "#divFormFamilias"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_familias.php";

        $(document).ready(function(){
            $(modal).setModal("familia", 550);
            $(grid).setGrid();
            $("#selSubFamilias").rellenaSelect("<?= $pathWS ?>WS_subfamilias.php");
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
    <div id="divFormFamilias" class="formPopup">
        <form>
            <div class="form-group">
                <input type="text" id="iNombre" name="nombre" class="form-control campoNombre" placeholder="Nombre" required />
                <input type="hidden" id="hdnId" name="id" value="0" />
            </div>
            <div class="form-group">
                <select name="id_subfamilia" id="selSubFamilias" class="form-control  campoNombre" required>
                    <option value="" selected disabled>Subfamilias...</option>
                </select>
            </div>
            <div class="text-center">
                <input type="submit" id="btnAceptar" class="btn btn-default" value="Aceptar" />
                &nbsp;
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
        </form>
    </div>
</body>
</html>