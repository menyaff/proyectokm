<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Articulos</title>
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
                            <span class="fa fa-fw fa-archive"></span> Articulos
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->

                <div class="row wrapper-form-sm">
                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                     <fieldset>
                        <legend><h2>Articulos</h2></legend>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Clave" name="iClave">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Linea" name="iLinea">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Marca" name="iMarca">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Modelo" name="iModelo">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Descripción" name="iDescripcion">
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Código de Barras" name="iCodigoBarras">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Sustituto" name="iSustituto">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Unidades" name="iUnidades">
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Existencia" name="iExistencia">
                        </div>
                        <fieldset>
                            <legend><h5>Pertenece a:</h5></legend>
                            <div class="form-group col-md-4 col-sm-12">
                                <select class="form-control" name="sArea">
                                    <option selected disabled>Área</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-12">
                                <select class="form-control" name="sFamilia">
                                    <option selected disabled>Familia</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-12">
                                <select class="form-control" name="sSubfamilia">
                                    <option selected disabled>Subfamilia</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </fieldset>
                        <div class="form-group">
                            <input type="file">
                        </div>
                        
                     </fieldset>
                     <br><br>
                     <fieldset>
                         <legend><h2>Costos y Precios</h2></legend>
                         <div class="form-group">
                            <input type="text" class="form-control" placeholder="Precio de Recuperación" name="iPrecioRecuperacion">
                         </div>
                         <div class="form-group">
                            <input type="text" class="form-control" placeholder="Precio de Lista" name="iPrecioLista">
                         </div>
                         <div class="form-group">
                            <input type="text" class="form-control" placeholder="Precio de Mayoreo" name="iPrecioMayoreo">
                         </div>
                     </fieldset>
                     <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-default">Enviar</button>
                        <button type="reset" class="btn btn-default">Limpiar</button>
                     </div>
                   </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>