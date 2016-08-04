<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Lugares</title>
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
                        direccion: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "direccion",
                            title: "Dirección"
                        },
                        templateBotones
                    ];
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid";  
        titulo = "lugar";

        WS =  "<?= $pathWS ?>WS_lugares.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 800);
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
            <div class="form-group">
                <textarea name="direccion" id="txtDireccion" class="form-control form-md" rows="4" placeholder="Dirección"></textarea>
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
                <th>Lugar</th>
                <th>Dirección</th>
            </tr>
            <tr>
                <td name="nombre"></td>
                <td name="direccion"></td>
            </tr>
        </table>
    </div>
</body>
</html>