<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Usuarios</title>
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
                        <li>
                            <a href="#"><span class="fa fa-fw fa-book"></span> Catálagos</a>
                        </li>
                        <li class="active">
                            <span class="fa fa-fw fa-user"></span> Usuarios
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->

                <div class="row wrapper-form-sm">
                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <fieldset>
                        <legend><h2>Usuarios</h2></legend>
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Contraseña" name="iContrasenha">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="No. Empleado" name="iNoEmpleado">
                            </div>
                             <div class="form-group col-md-12">
                                <select class="form-control" name="sRol">
                                    <option selected disabled>Rol</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
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