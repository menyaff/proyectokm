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
            $(modal).setModal("Articulos", 550);
            $(grid).setGrid();
            $("#selLugares").rellenaSelect("<?= $pathWS ?>WS_lugares.php");
            $("#selAreas").rellenaSelect("<?= $pathWS ?>WS_areas.php");
        });
    </script>
</head>
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
                        <li class="active"><span class="fa fa-fw fa-archive"></span> Articulos</li>
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
                <input type="hidden" id="hdnId" name="id" value="0"/>
                <input type="text" id="iClave" class="form-control form-md" placeholder="Clave" name="clave">
            </div>
            <div class="form-group">
                <input type="text" id="iNombre" class="form-control form-md" placeholder="Nombre" name="nombre">
            </div>
            <div class="form-group">
                <input type="text" id="iLinea" class="form-control form-md" placeholder="Linea" name="linea">
            </div>
            <div class="form-group">
                <input type="text" id="iMarca" class="form-control form-md" placeholder="Marca" name="marca">
            </div>
            <div class="form-group">
                <input type="text" id="iModelo" class="form-control form-md" placeholder="Modelo" name="modelo">
            </div>
            <div class="form-group">
                <input type="text" id="txtDescripcion" class="form-control form-md" placeholder="Descripción" name="descripcion">
            </div>
            <div class="form-group">
                <select id="selLugares" class="form-control form-md" name="lugar">
                    <option value="" selected disabled>Lugares...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" id="iCodigoBarras" class="form-control form-md" placeholder="Código de Barras" name="codigoBarras">
            </div>
            <div class="form-group">
                <input type="text" id="iSustituto" class="form-control form-md" placeholder="Sustituto" name="sustituto">
            </div>
            <div class="form-group">
                <input type="text" id="iUnidad" class="form-control form-md" placeholder="Unidades" name="unidades">
            </div>
            <div class="form-group">
                <input type="number" id="iExistencias" class="form-control form-md" placeholder="Existencias" name="existencias">
            </div>
            <div class="form-group">
                <select id="selAreas" class="form-control form-md" name="area">
                    <option value="" selected disabled>Áreas...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="file" id="fileArchivo" class="form-control form-md" name="archivo">
            </div>
            <div class="form-group">
                <input type="text" id="iPrecioRecuperacion" class="form-control form-md" placeholder="Precio Recuperación" name="precioRecuperacipn">
            </div>
            <div class="form-group">
                <input type="text" id="iPrecioLista" class="form-control form-md" placeholder="Precio de Lista" name="precioLista">
            </div>
            <div class="form-group">
                <input type="text" id="iPrecioMayoreo" class="form-control form-md" placeholder="Precio de Mayoreo" name="precioMayoreo">
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