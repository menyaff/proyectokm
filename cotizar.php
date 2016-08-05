<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Cotizar</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();
    ?>
    <style type="ttext/css">
        #divContenido{ width: 250px; }
    </style>
    <script>
        templateID = "";
        templateBotones = "";
    </script>
    <script src="<?= $pathJS ?>forms.js"></script>
    <script src="<?= $pathJS ?>grids.js"></script>
    <script>
        jsonFields = {
                        id: { type: "number" },
                        nombre: { type: "string" },
                        existencias: { type: "number" },
                        precioLista: { type: "number" },
                        total: { type: "number" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "articulo",
                            title: "Nombre"
                        },
                        {
                            field: "cantidad",
                            title: "Cantidad"
                        },
                        {
                            field: "precioLista",
                            title: "Precio"
                        },
                        {
                            field: "total",
                            title: "Total"
                        },
                        templateBotones
                    ];
        modal = "#divModal"; 
        grid = "#divGridArticulos";
        WS =  "<?= $pathWS ?>WS_eventos.php";

        $(document).ready(function(){
            $(modal).setModal("articulo para evento", 450);
            $(grid).setGrid("selectArticulo");

            $("#selClientes").rellenaSelect("<?= $pathWS ?>WS_clientes.php");
            $("#selTipos").rellenaSelect("<?= $pathWS ?>WS_tiposEvento.php");
            $("#selLugares").rellenaSelect("<?= $pathWS ?>WS_lugares.php");
            $("#selCuentasBancarias").rellenaSelect("<?= $pathWS ?>WS_cuentasBancarias.php");
            $("#selMetodosPago").rellenaSelect("<?= $pathWS ?>WS_metodosPago.php");
            $("#iFechaEntrega, #iFechaSeguimiento, #iFechaFinal").kendoDatePicker({
                format: "dd - MMMM - yyyy"
            });
            $("#selSubFamilias").rellenaSelect("<?= $pathWS ?>WS_subFamilias.php");
            $("#selSubFamilias").change(function(){
                var elem = $(this);
                
                var jsonSubFamilias = '{"selSubFamilias":"'+elem.val()+'"}';
                jsonSubFamilias = $.parseJSON(jsonSubFamilias);

                $("#selFamilias").rellenaSelect("<?= $pathWS ?>WS_familias.php",jsonSubFamilias);
            });
            $("#selFamilias").change(function(){
                var elem = $(this);
                
                var jsonFamilias = '{"selFamilias":"'+elem.val()+'"}';
                jsonFamilias = $.parseJSON(jsonFamilias);
                
                $("#selAreas").rellenaSelect("<?= $pathWS ?>WS_areas.php",jsonFamilias);
            });
            $("#selAreas").change(function(){
                var elem = $(this);
                
                var jsonAreas = '{"filtro":"id_area='+elem.val()+'"}';
                jsonAreas = $.parseJSON(jsonAreas);
                
                $("#selArticulos").rellenaSelect("<?= $pathWS ?>WS_articulos.php",jsonAreas);
            });
            $("#btnAgregaArticulo").click(function(event){
                event.stopPropagation();

                var elem = $(this).parents("form");
                
                $(elem).salvaInfo("asignaArticulo","selectArticulo");
            });
        });
    </script>
</head>
<body>
    <div id="wrapper">
        <?php menuPrincipal(); ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <!-- mapa ubicación -->
                <div class="row">
                    <?php breadcrumb(); ?>
                </div>
            <!-- /mapa ubicación -->
                <div id="divContenido">
                    <form method="post">
                        <input type="hidden" name="id" id="hdnIdArticuloEvento" value="0" />
                        <div class="form-group">
                            <select name="cliente" id="selClientes" class="form-control form-sm">
                                <option value="" selected disabled>Clientes...</option>
                            </select>
                        </div>
                        <fieldset>
                            <legend>Evento</legend>
                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <select name="lugar" id="selLugares" class="form-control">
                                        <option value="" selected disabled>Lugares...</option>
                                    </select>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <select name="tipo" id="selTipos" class="form-control">
                                        <option value="" selected di    sabled>Tipos de evento...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <input type="text" name="fechaEntrega" id="iFechaEntrega" class="form-control" placeholder="Fecha de entrega">
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <input type="text" name="fechaSeguimiento" id="iFechaSeguimiento" class="form-control" placeholder="Fecha de seguimiento">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <input type="text" name="fechaFinal" id="iFechaFinal" class="form-control" placeholder="Fecha final">
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <input type="number" name="invitados" id="iInvitados" class="form-control" placeholder="Invitados">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <textarea name="direccion" id="taDireccion" cols="30" rows="3" class="form-control" placeholder="Direcci&oacute;n"></textarea>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <input type="radio" name="salon" id="rdSalonSalon" value="salon">
                                    <label for="rdSalonSalon">Sal&oacute;n</label>
                                    &nbsp;&nbsp;
                                    <input type="radio" name="salon" id="rdSalonEvento" value="evento">
                                    <label for="rdSalonEvento">Evento</label>
                                </div>
                            </div>
                        </fieldset>
                        <br />
                        <div id="divGridArticulos"></div>
                        <br />
                        <div class="row">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="utilidadCuenta" id="iUtilidadCuenta" class="form-control" placeholder="Utilidad" />
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <select name="cuentaBancaria" id="selCuentasBancarias" class="form-control">
                                    <option value="" selected disabled>Cuentas bancarias...</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="montoServicios" id="iMontoServicios" class="form-control" placeholder="Monto servicios">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <select name="depositosEnGarantia" id="selDepositosEnGarantia" class="form-control">
                                    <option value="" selected disabled>Depositos en garant&iacute;a...</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="montoDepositosEnGarantia" id="iMontoDepositosEnGarantia" class="form-control" placeholder="Monto" />
                            </div>
                            <div class="col-md-4 col-lg-4 hidden-sm">&nbsp;</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <select name="guardias" id="selGuardias" class="form-control">
                                    <option value="" selected disabled>Guardias...</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="cantidadGuardias" id="iCantidadGuardias" class="form-control" placeholder="Cantidad guardias">
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="montoGuardias" id="iMontoGuardias" class="form-control" placeholder="Monto servicios">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <select name="metodoPago" id="selMetodosPago" class="form-control">
                                    <option value="" selected disabled>M&eacute;todos de pago...</option>
                                </select>
                            </div>
                            <div class="col-md-4 col-lg-4 hidden-sm">
                                &nbsp;
                            </div>
                            <div class="col-md-4 col-lg-4 hidden-sm">
                                &nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="totalEvento" id="iTotalEvento" class="form-control" placeholder="Total del evento..." />
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="anticipo" id="iAnticipo" class="form-control" placeholder="Anticipo..." />
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="restante" id="iRestante" class="form-control" placeholder="Restante..." />
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center col-sm-12 col-md-12 col-lg-12">
                                <input type="btton" class="btn btn-default" value="Enviar" />
                                <input type="reset" class="btn btn-default" value="Limpiar" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup">
        <form method="post">
            <input type="hidden" name="id" id="hdnId" value="0" />
            <div class="form-group">
                <select name="id_subfamilia" id="selSubFamilias" class="form-control form-sm">
                    <option value="" selected disabled>Subfamilias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_familia" id="selFamilias" class="form-control form-sm selDependiente">
                    <option value="" selected disabled>Familias...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_area" id="selAreas" class="form-control form-sm selDependiente">
                    <option value="" selected disabled>Áreas...</option>
                </select>
            </div>
            <div class="form-group">
                <select name="id_articulo" id="selArticulos" class="form-control form-sm selDependiente">
                    <option value="" selected disabled>Articulos...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="number" name="cantidad" id="iCantidad" class="form-control form-sm" placeholder="Cantidad"/>
            </div>
            <div class="text-center">
                <input id="btnAgregaArticulo" type="button" class="btn btn-default" value="Enviar"/>
                <input type="reset" class="btn btn-default" value="Limpiar"/>
            </div>
       </form>
    </div>
</body>
</html>