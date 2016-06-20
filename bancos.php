<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Bancos</title>
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
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_bancos.php";

        $(document).ready(function(){
            $(modal).setModal("Bancos", 550);
            $(grid).setGrid();
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
                        <li class="active"><span class="fa fa-fw fa-university"></span> Bancos</li>
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
                <input type="text" class="form-control form-md" placeholder="Clave" name="iClave">
            </div>
            <div class="form-group">
                <input type="text" class="form-control form-md" placeholder="Nombre" name="iNombre">
            </div>
            <div class="form-group">
                <input type="text" class="form-control form-md" placeholder="No. Cuenta" name="iNoCuenta">
            </div>
            <div class="form-group">
                <span></span>
                <input type="text" class="form-control form-md" placeholder="CLABE" name="iClave">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-default">Enviar</button>
                <button type="reset" class="btn btn-default">Limpiar</button>
            </div>
       </form>
    </div>
    <!-- 
        <div class="row wrapper-form-sm">
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
             <fieldset>
                <legend><h2>Bancos</h2></legend>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Clave" name="iClave">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="No. Cuenta" name="iNoCuenta">
                </div>
                <div class="form-group">
                    <span></span>
                    <input type="text" class="form-control" placeholder="CLABE" name="iClave">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-default">Enviar</button>
                    <button type="reset" class="btn btn-default">Limpiar</button>
                </div>
             </fieldset>
           </form>
        </div>
     -->
</body>
</html>