<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Áreas</title>
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
                        id: { type: "number" },
                        nombre: { type: "string" },
                        familia: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "familia",
                            title: "Familia"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_areas.php";

        $(document).ready(function(){
            $(modal).setModal("Áreas", 550);
            $(grid).setGrid();
            $("#selSubFamilias").rellenaSelect("<?= $pathWS ?>WS_subfamilias.php");
            $("#selFamilias").rellenaSelect("<?= $pathWS ?>WS_familias.php");
        });
    </script>
</head>
<body>
<body>
    <div id="wrapper">
        <?php menuLateral(); ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <!-- mapa ubicación -->
                <div class="row">
                    <ol class="breadcrumb">
                        <li><a href="index.php"><span class="fa fa-fw fa-home"></span> Inicio</a></li>
                        <li class="active"><span class="fa fa-fw fa-bookmark"></span> Áreas</li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup">
        <form>
            <div class="form-group">
                <select name="id_subfamilia" id="selSubFamilias" class="form-control form-md" required>
                    <option value="" selected disabled>Subfamilias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_familia" id="selFamilias" class="form-control form-md" required>
                    <option value="" selected disabled>Familias...</option>
                </select>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-default">Enviar</button>
                <button type="reset" class="btn btn-default">Limpiar</button>
            </div>
       </form>
    </div>
    <!-- 
        <div id="divModal" class="formPopup">
            <form>
             <fieldset>
                <legend><h2>Áreas</h2></legend>
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Clave" name="iClave">
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                    </div>
                </div>
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-default">Enviar</button>
                    <button type="reset" class="btn btn-default">Limpiar</button>
                </div>
             </fieldset>
           </form>
        </div>
     -->
</body>
</html>