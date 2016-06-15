<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Bancos</title>
</head>
<body>
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
                            <span class="fa fa-fw fa-university"></span> Bancos
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->

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
            </div>
        </div>
    </div>
</body>
</html>