<!DOCTYPE html!>
<html lang="es">
<head>
    <?php include 'head.php'; ?>
    <title>Cotización</title>
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
                            <span class="fa fa-fw fa-shopping-cart"></span> Cotización
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                       <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                        <fieldset>
                            <legend><h2>Cotización</h2></legend>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Clave" name="iClave">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nombre" name="iNombre">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nombre del Contacto" name="iNomContacto">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Cargo del Contacto" name="iCargoContacto">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Telefono del Contacto" name="iTelContacto">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-default">Enviar</button>
                                <button type="reset" class="btn btn-default">Limpiar</button>
                            </div>
                        </fieldset>
                       </form>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <form action="<?php echo $_SERVER['PHP_SELF']; ?>">
                        <fieldset>
                            <legend><h2>Evento</h2></legend>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Lugar" name="iLugar">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Tipo" name="iTipo">
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                <input type="text" class="form-control" placeholder="Fecha de Entrega" name="iFechEntrega">
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                <input type="text" class="form-control" placeholder="Fecha de Seguimiento" name="iFechSeg">
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                <input type="text" class="form-control" placeholder="Fecha de Final" name="iFechFinal">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Dirección" name="iDireccion">
                            </div>
                            <div class="form-group">
                                <span></span>
                                <input type="number" class="form-control" placeholder="Número de Invitados" name="iNumInvitados">
                            </div>
                            <div class="form-group">
                                <label class="radio-inline">
                                    <input type="radio" name="rbtnEvento" value="1" checked> Salón
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="rbtnEvento" value="2"> Evento
                                </label>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-default">Enviar</button>
                                <button type="reset" class="btn btn-default">Limpiar</button>
                            </div>
                        </fieldset>
                       </form>
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <div class="wrapper-form-md">
                        <div class="col-md-4 col-sm-12">
                            <div class="form-group input-group">
                                <input type="text" class="form-control" placeholder="Utilidad" name="iUtilidad">
                                <span class="input-group-addon">%</span>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="sDepGarantia">
                                    <option selected disabled>Dépositos en Garantía</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="sGuardias">
                                    <option selected disabled>Guardias</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="sMetodoPago">
                                    <option selected disabled>Método de Pago</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Total de Evento" name="iTotalEvento">
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Cuenta" name="iCuenta">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Monto" name="iMonto">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Cantidad" name="iCantidad">
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="sBancos">
                                    <option selected disabled>Bancos</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Anticipo" name="iAnticipo">
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Monto Servicios" name="iMontoServicios">
                            </div>
                            <br>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Monto" name="iMonto">
                            </div>
                            <br>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Restante" name="iRestante">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>