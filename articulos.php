<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Articulos</title>
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
                        area: { type: "string" },
                        familia: { type: "string" },
                        subfamilia: { type: "string" },
                        existencias: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "area",
                            title: "Área"
                        },
                        {
                            field: "familia",
                            title: "Familia"
                        },
                        {
                            field: "subfamilia",
                            title: "Subfamilia"
                        },
                        {
                            field: "existencias",
                            title: "Existencias"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_articulos.php";

        $(document).ready(function(){
            $(modal).setModal("articulo", 550);
            $(grid).setGrid();

            $("#selLugares").rellenaSelect("<?= $pathWS ?>WS_lugares.php");
            $("#selSubFamilias").rellenaSelect("<?= $pathWS ?>WS_subFamilias.php");

            $("#selSubFamilias").change(function(){
                var elem = $(this);
                
                var jsonSubFamilias = '{"selSubFamilias":"'+elem.val()+'"}';
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
                <input type="hidden" name="id" id="hdnId" value="0"/>
                <input type="text" name="clave" id="iClave" class="form-control form-md" placeholder="Clave">
            </div>
            <div class="form-group">
                <input type="text" name="nombre" id="iNombre" class="form-control form-md" placeholder="Nombre">
            </div>
            <div class="form-group">
                <input type="text" name="linea" id="iLinea" class="form-control form-md" placeholder="Linea">
            </div>
            <div class="form-group">
                <input type="text" name="marca" id="iMarca" class="form-control form-md" placeholder="Marca">
            </div>
            <div class="form-group">
                <input type="text" name="modelo" id="iModelo" class="form-control form-md" placeholder="Modelo">
            </div>
            <div class="form-group">
                <textarea name="descripcion" id="txtDescripcion" class="form-control form-md" rows="4" placeholder="Concepto"></textarea>
            </div>
            <div class="form-group">
                <select name="lugar" id="selLugares" class="form-control form-md">
                    <option value="" selected disabled>Lugares...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="codigoBarras" id="iCodigoBarras" class="form-control form-md" placeholder="Código de Barras">
            </div>
            <div class="form-group">
                <input type="text" name="sustituto" id="iSustituto" class="form-control form-md" placeholder="Sustituto">
            </div>
            <div class="form-group">
                <input type="text" name="unidades" id="iUnidad" class="form-control form-md" placeholder="Unidades">
            </div>
            <div class="form-group">
                <input type="number" name="existencias" id="iExistencias" class="form-control form-md" placeholder="Existencias">
            </div>
            <div class="form-group">
                <select name="id_subfamilia" id="selSubFamilias" class="form-control form-md">
                    <option value="" selected disabled>Subfamilias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_familia" id="selFamilias" class="form-control form-md selDependiente">
                    <option value="" selected disabled>Familias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_area" id="selAreas" class="form-control form-md selDependiente">
                    <option value="" selected disabled>Áreas...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="file" name="archivo" id="fileArchivo" class="form-control form-md">
            </div>
            <div class="form-group">
                <input type="text" name="precioRecuperacipn" id="iPrecioRecuperacion" class="form-control form-md" placeholder="Precio Recuperación">
            </div>
            <div class="form-group">
                <input type="text" name="precioLista" id="iPrecioLista" class="form-control form-md" placeholder="Precio de Lista">
            </div>
            <div class="form-group">
                <input type="text" name="precioMayoreo" id="iPrecioMayoreo" class="form-control form-md" placeholder="Precio de Mayoreo">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-default">Enviar</button>
                <button type="reset" class="btn btn-default">Limpiar</button>
            </div>
        </form>
    </div>
</body>
</html>