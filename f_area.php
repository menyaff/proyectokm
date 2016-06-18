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
        <div class="row wrapper-form-md">
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
    </div>
</body>
</html>