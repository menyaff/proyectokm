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
                        {
                            field: "subfamilia",
                            title: "Subamilia"
                        },

                        templateBotones
                    ];
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid";  
        titulo = "área";

        WS = "<?= $pathWS ?>WS_areas.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 600);
            $(modal).setModal(titulo, 550);
            $(grid).setGrid();
            $("#selSubFamilias").rellenaSelect("<?= $pathWS ?>WS_subfamilias.php");

            $("#selSubFamilias").change(function() {
                var elem = $(this);

                var jsonSubfamilias = '{"selSubfamilias":"'+elem.val()+'"}';
                jsonSubfamilias = $.parseJSON(jsonSubfamilias);

                $("#selFamilias").rellenaSelect("<?= $pathWS ?>WS_familias.php",jsonSubfamilias);
            });
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
                <input type="text" id="iNombre" name="nombre" class="form-control form-md" placeholder="Nombre" required />
                <input type="hidden" id="hdnId" name="id" value="0" />
            </div>
            <div class="form-group">
                <select name="id_subfamilia" id="selSubFamilias" class="form-control form-md" required>
                    <option value="" selected disabled>Subfamilias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_familia" id="selFamilias" class="form-control form-md selDependiente" required>
                    <option value="" selected disabled>Familias...</option>
                </select>
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
                <th>Área</th>
                <th>Subfamilia</th>
                <th>Familia</th>
            </tr>
            <tr>
                <td name="nombre" width="30%"></td>
                <td name="familia" width="35%"></td>
                <td name="subfamilia" width="35%"></td>
            </tr>
        </table>
    </div>
</body>
</html>