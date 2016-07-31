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

        $accionGrid="selectArticulo";
        if(isset($_GET["cotizacion"])){
            $accionGrid .= "&idEvento=".$_GET["cotizacion"];
            $idRegistro = $_GET["cotizacion"];
        }
        if(isset($_GET["evento"])){
            $accionGrid .= "&idEvento=".$_GET["evento"];
            $idRegistro = $_GET["evento"];
        }
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
            $.ajax({
                url: WS+"?accion=purgaArticulos",   
                type: "POST",
                async: true
            });

            $(modal).setModal("articulo para evento", 450);
            $(grid).setGrid("<?= $accionGrid ?>");

            $("#selStatus").rellenaSelect("<?= $pathWS ?>WS_status.php");
            $("#selClientes").rellenaSelect("<?= $pathWS ?>WS_clientes.php");
            $("#selVendedores").rellenaSelect("<?= $pathWS ?>WS_vendedores.php");
            $("#selTipos").rellenaSelect("<?= $pathWS ?>WS_tiposEvento.php");
            $("#selLugares").rellenaSelect("<?= $pathWS ?>WS_lugares.php");
            $("#selGuardias").rellenaSelect("<?= $pathWS ?>WS_guardias.php");
            $("#selCuentasBancarias").rellenaSelect("<?= $pathWS ?>WS_cuentasBancarias.php");
            $("#selMetodosPago").rellenaSelect("<?= $pathWS ?>WS_metodosPago.php");
            $("#iFechaEntrega, #iFechaSeguimiento, #iFechaFinal").kendoDateTimePicker({
                format: "yyyy/MM/dd HH:mm"
            });
            $("#selSubFamilias").rellenaSelect("<?= $pathWS ?>WS_subFamilias.php");

            $("#divSalEvt>label").click(function(){
                var elem = $(this);

                $("input[idReal='"+elem.attr("for")+"']").click();
            });

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
            $("#btnAceptarEvento").click(function(event){
                event.stopPropagation();

                $(this).parents("form").salvaInfo("update","<?= $accionGrid ?>");
            });
            $("#btnAgregaArticulo").click(function(event){
                event.stopPropagation();

                var elem = $(this).parents("form");
                
                $(elem).salvaInfo("asignaArticulo","<?= $accionGrid ?>");
            });
            $("#iTotalEvento, #iAnticipo").keyup(function(){
                var total = $("#iTotalEvento").val() == "" ? 0 : $("#iTotalEvento").val();
                var anticipo = $("#iAnticipo").val() == "" ? 0 : $("#iAnticipo").val();

                var restante = total-anticipo;

                if(restante<0)
                    $("#iRestante").css("color","#F00");
                else
                    $("#iRestante").css("color","");

                $("#iRestante").val(restante);
            });
            <?php if(isset($_GET["cotizacion"])){ ?>
            $("#divContenido>form").inicializaInfo(WS,"selectCotizacion",<?= $_GET["cotizacion"] ?>,function(){ $("#iTotalEvento").keyup(); });
            <?php } ?>
            <?php if(isset($_GET["evento"])){ ?>
            $("#divContenido>form").inicializaInfo(WS,"selectEvento",<?= $_GET["evento"] ?>,function(){ $("#iTotalEvento").keyup(); });
            <?php } ?>
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
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <input type="checkbox" name="cotizacion" id="chCotizacion" />
                                <label for="chCotizacion">Cotizaci&oacute;n</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-5 col-lg-5 form-group">
                                <input type="text" name="nombre" id="iNombre" class="form-control" placeholder="Nombre" />
                            </div>
                            <div class="col-sm-12 col-md-5 col-lg-5 form-group">
                                <select name="id_status" id="selStatus" class="form-control">
                                    <option value="" selected="" disabled="">Status...</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-5 col-lg-5 form-group">
                                <select name="id_vendedor" id="selVendedores" class="form-control">
                                    <option value="" selected disabled>Vendedores...</option>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-5 col-lg-5 form-group">
                                <select name="id_cliente" id="selClientes" class="form-control">
                                    <option value="" selected disabled>Clientes...</option>
                                </select>
                            </div>
                        </div>
                        <fieldset>
                            <legend>Evento</legend>
                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-6 form-group">
                                    <select name="id_catLugares" id="selLugares" class="form-control">
                                        <option value="" selected disabled>Lugares...</option>
                                    </select>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6 form-group">
                                    <select name="id_tipoEvento" id="selTipos" class="form-control">
                                        <option value="" selected disabled>Tipos de evento...</option>
                                    </select>
                                </div>
                                <div class="col-sm-12 col-md-9 col-lg-9 form-group">
                                    <input type="text" name="direccion" id="iDireccion" class="form-control" placeholder="Direcci&oacute;n" />
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-3 form-group">
                                    <input type="number" name="invitados" id="iInvitados" class="form-control" placeholder="Invitados">
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 form-group">
                                    <input type="text" name="fechaEntrega" id="iFechaEntrega" placeholder="Fecha de entrega">
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 form-group">
                                    <input type="text" name="fechaSeguimiento" id="iFechaSeguimiento" placeholder="Fecha de seguimiento">
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 form-group">
                                    <input type="text" name="fechaFinal" id="iFechaFinal" placeholder="Fecha final">
                                </div>
                                <div id="divSalEvt" class="col-xs-6 col-sm-6 col-md-4 col-lg-3 form-group">
                                    <input type="radio" name="salon" id="rdSalon" idReal="rdSalonSalon" value="1">
                                    <label for="rdSalonSalon">Sal&oacute;n</label>
                                    &nbsp;&nbsp;
                                    <input type="radio" name="salon" id="rdSalon" idReal="rdSalonEvento" value="0">
                                    <label for="rdSalonEvento">Evento</label>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Art&iacute;culos</legend>
                            <div id="divGridArticulos"></div>
                        </fieldset>
                        <br />
                        <div class="row">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="utilidadCuenta" id="iUtilidadCuenta" class="form-control" placeholder="Utilidad" />
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <select name="id_cuentaBancaria" id="selCuentasBancarias" class="form-control">
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
                                    <?php
                                        for($i=0;$i<=100;$i+=10)
                                            echo "<option value=\"".$i.".00\">".$i."%</option>";
                                    ?>
                                </select>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="number" name="montoDepositosEnGarantia" id="iMontoDepositosEnGarantia" class="form-control" placeholder="Monto" />
                            </div>
                            <div class="col-md-4 col-lg-4 hidden-sm">&nbsp;</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <select name="id_catGuardias" id="selGuardias" class="form-control">
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
                                <select name="id_catMetodosPago" id="selMetodosPago" class="form-control">
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
                                <input type="text" name="restante" id="iRestante" class="form-control" placeholder="Restante..." readonly />
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center col-sm-12 col-md-12 col-lg-12">
                                <input type="button" id="btnAceptarEvento" class="btn btn-default" value="Enviar" id="cosa" />
                                <input type="reset" class="btn btn-default" value="Limpiar" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup">
        <input type="hidden" id="hdnIdEvento" value="<?= isset($idRegistro) ? $idRegistro : "" ?>" />
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
                <input type="number" name="cantidad" id="iCantidad" class="form-control form-sm" placeholder="Cantidad" />
            </div>
            <div class="text-center">
                <input id="btnAgregaArticulo" type="button" class="btn btn-default" value="Enviar" />
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
       </form>
    </div>
</body>
</html>