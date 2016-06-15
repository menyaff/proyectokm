<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Empleados</title>
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
                            <span class="fa fa-fw fa-user"></span> Empleados
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->

                <div class="row wrapper-form-md">
                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <fieldset>
                        <legend><h2>Empleados</h2></legend>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Clave" name="iClave">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Dirección" name="iDireccion">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Ciudad" name="iCiudad">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Código Postal" name="iCP">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Celular" name="iCelular">
                            </div>
                        </div>
                        <div class="col-md-6">
                             <div class="form-group">
                                <input type="text" class="form-control" placeholder="Puesto" name="iPuesto">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Colonia" name="iColonia">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Estado" name="iEstado">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Teléfono" name="iTelefono">
                            </div>
                            <div class="form-group">
                                <input type="mail" class="form-control" placeholder="Email" name="iEmail">
                            </div>
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
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Usuario" name="iUsuario">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Contraseña" name="iContrasenha">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label>Días que puede laborar</label>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="1">Lunes
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="2">Martes
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="3">Miércoles
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="4">Jueves
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="5">Viernes
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="6">Sábado
                                        </label>
                                    </div>
                                </div>
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