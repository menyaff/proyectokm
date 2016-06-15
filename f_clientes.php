<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Clientes</title>
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
                            <span class="fa fa-fw fa-user"></span> Clientes
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->
                <div class="row">
                    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Clave" name="iClave">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Monto de Crédito" name="iMontoCredito">
                            </div>
                            <fieldset>
                                <legend>Datos de Contacto</legend>
                                <div class="form-group">
                                    <select class=" form-control" name="sTipo">
                                        <option selected disable>Tipo</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Nombre" name="iDCNombre">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Home Page" name="iDCHomePage">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Direccion" name="iDCDireccion">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Colonia" name="iDCColonia">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Ciudad" name="iDCCiudad">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Estado" name="iDCEstado">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Código Postal" name="iDCcp">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Teléfono" name="iDCTelefono">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Celular" name="iDCCelular">
                                </div>
                                <div class="form-group">
                                    <input type="mail" class="form-control" placeholder="Email" name="iDCEmail">
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-md-6">
                            <div style="height: 3.6em;"></div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Clave" name="iClave">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Clave" name="iClave">
                            </div>
                            <fieldset>
                                <legend>Información Fiscal</legend>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="RFC" name="iDCRFC">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Razón Social" name="iDCRazonSocial">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Calle" name="iDCCalle">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Colonia" name="iDCColonia">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Ciudad" name="iDCCiudad">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Estado" name="iDCEstado">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="País" name="iDCPais">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Código Postal" name="iDCcp">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Número Interior" name="iDCNumInt">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Número Exterior" name="iDCNumExt">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Localidad" name="iDCLocalidad">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Municipio" name="iDCMunicipio">
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-md-12">
                            <div class="text-center">
                                    <button type="submit" class="btn btn-default">Enviar</button>
                                    <button type="reset" class="btn btn-default">Limpiar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>