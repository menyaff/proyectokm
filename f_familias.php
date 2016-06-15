<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Familias</title>
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
                            <span class="fa fa-fw fa-users"></span> Familias
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->

                <div class="row wrapper-form-sm">
                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                     <fieldset>
                        <legend><h2>Familias</h2></legend>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Clave" name="iClave">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="sArea">
                                <option selected disabled>Área</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
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