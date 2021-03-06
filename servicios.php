<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Servicios</title>
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
                        clave: { type: "string" },
                        concepto: { type: "string" },
                        precioUnitario: { type: "number" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "clave",
                            title: "Clave"
                        },
                        {
                            field: "concepto",
                            title: "Concepto"
                        },
                        {
                            field: "precioUnitario",
                            title: "Precio Unitario"
                        },
                        templateBotones
                    ];
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid";  
        titulo = "servicio";

        WS =  "<?= $pathWS ?>WS_servicios.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 400);
            $(modal).setModal(titulo, 550);
            $(grid).setGrid();

            $("#selSubFamilias").rellenaSelect("<?= $pathWS ?>WS_subfamilias.php");
            
            $("#selSubFamilias").change(function(){
                var elem = $(this);
                
                var jsonSubFamilias = '{"selSubfamilias":"'+elem.val()+'"}';
                jsonSubFamilias = $.parseJSON(jsonSubFamilias);

                $("#selFamilias").rellenaSelect("<?= $pathWS ?>WS_familias.php",jsonSubFamilias);
            });
            $("#selFamilias").change(function(){
                var elem = $(this);
                
                var jsonFamilias = '{"selFamilias":"'+elem.val()+'"}';
                jsonFamilias = $.parseJSON(jsonFamilias);
              
                $("#selAreas").rellenaSelect("<?= $pathWS ?>WS_areas.php",jsonFamilias);
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
                <input type="hidden" id="hdnId" name="id" value="0"/>
                <input type="text" name="clave" id="iClave" class="form-control form-md" placeholder="Clave"/>
            </div>
            <div class="form-group">
                <textarea name="concepto" id="txtConcepto" class="form-control form-md" rows="4" placeholder="Concepto"></textarea>
            </div>
            <div class="form-group">
                <select name="id_subfamilia" id="selSubFamilias" class="form-control form-md">
                    <option value="" selected disabled>Subfamilias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_familia" id="selFamilias" class="form-control form-md">
                    <option value="" selected disabled>Familias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="area" id="selAreas" class="form-control form-md">
                    <option value="" selected disabled>Áreas...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="number" name="cantidad" id="iCantidad" class="form-control form-md" placeholder="Cantidad">
            </div>
            <div class="form-group">
                <input type="number" step="any" min="0" name="precioUnitario" id="iPrecioUnitario" class="form-control form-md" placeholder="Precio Unitario">
            </div>
            <div class="text-center">
                <input type="submit" id="btnAceptar" class="btn btn-default" value="Aceptar" />
                &nbsp;
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
        </form>
    </div>
    <div id="divModalDetalles" class="formPopup">
        <table class="table table-responsive">
            <tr>
                <th class="thead">Clave</th>
                <td name="clave"></td>
            </tr>
            <tr>
                <th class="thead">Concepto</th>
                <td name="concepto"></td>
            </tr>
            <tr>
                <th class="thead">Subfamilia</th>
                <td name="subFamilia"></td>
            </tr>
            <tr>
                <th class="thead">Familia</th>
                <td name="familia"></td>
            </tr>
            <tr>
                <th class="thead">Área</th>
                <td name="area"></td>
            </tr>
            <tr>
                <th class="thead">Cantidad</th>
                <td name="cantidad"></td>
            </tr>
            <tr>
                <th class="thead">Precio Unitario</th>
                <td name="precioUnitario"></td>
            </tr>
            <tr>
                <th class="thead"><u>Total</u></th>
                <td name="total"></td>
            </tr>
        </table>
    </div>
</body>
</html>