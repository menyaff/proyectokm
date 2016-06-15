<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Áreas</title>
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
                            <span class="fa fa-fw fa-bookmark"></span> Áreas
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->

                <div class="row wrapper-form-md">
                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
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
        </div>
    </div>
</body>
</html>