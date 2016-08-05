<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Eventos</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();
    ?>
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
                        familia: { type: "string" }
                    };
        jsonColumns = [
                        templateID,
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "id_status",
                            title: "Status"
                        },
                        {
                            field: "fechaEntrega",
                            title: "Fecha"
                        },
                        {   field: "vendedor",
                            title: "Vendedor"
                        },
                        templateBotones
                    ];
        modalDetalles = "#divModalDetalles";
        modal = "#divModal"; 
        grid = "#divGrid";
        titulo = "evento";

        WS = "<?= $pathWS ?>WS_eventos.php";

        $(document).ready(function(){
            $(modalDetalles).setModal(titulo, 700);
            $(modal).setModal(titulo, 550);
            $(grid).setGrid("selectEvento",function(){
                $(".btnEditarForm").unbind("click");
                $(".btnEditarForm").click(function(){
                    var registro = $(this).attr("registro");

                    window.location.href = "<?= __PathSitio__ ?>registraEvento.php?evento="+registro;
                });
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
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divModal" class="formPopup text-center">
        <form method="post" style="overflow: hidden; padding: 20px 60px">
        </form>
    </div>
    <div id="divModalDetalles" class="formPopup">
        <table class="table table-responsive">
            <tr>
                <th class="thead">Nombre</th>
                <td name="nombre"></td>
            </tr>
            <tr>
                <th class="thead">Cotización</th>
                <td name="cotizacion"></td>
            </tr>
            <tr>
                <th class="thead">Status Cotización</th>
                <td name="statusCotizacion"></td>
            </tr>
            <tr>
                <th class="thead">Status Evento</th>
                <td name="statusEvento"></td>
            </tr>
            <tr>
                <th class="thead">Cliente</th>
                <td name="cliente"></td>
            </tr>
            <tr>
                <th class="thead">Lugar</th>
                <td name="lugar"></td>
            </tr>
            <tr>
                <th class="thead">Tipo</th>
                <td name="tipo"></td>
            </tr>
            <tr>
                <th class="thead">Fecha de Entrega</th>
                <td name="fechaEntrega"></td>
            </tr>
            <tr>
                <th class="thead">Fecha Seguimiento</th>
                <td name="fechaSeguimiento"></td>
            </tr>
            <tr>
                <th class="thead">Fecha Final</th>
                <td name="fechaFinal"></td>
            </tr>
            <tr>
                <th class="thead">Dirección</th>
                <td name="direccion"></td>
            </tr>
            <tr>
                <th class="thead">Invitados</th>
                <td name="invitados"></td>
            </tr>
            <tr>
                <th class="thead">Salón</th>
                <td name="salon"></td>
            </tr>
            <tr>
                <th class="thead">Vendedor</th>
                <td name="vendedor"></td>
            </tr>
            <tr>
                <th class="thead">Utilidad de cuenta</th>
                <td name="utilidadCuenta"></td>
            </tr>
            <tr>
                <th class="thead">Cuenta</th>
                <td name="cuenta"></td>
            </tr>
            <tr>
                <th class="thead">Monto de servicios</th>
                <td name="montoServicios"></td>
            </tr>
            <tr>
                <th class="thead">Depositos en garantía</th>
                <td name="depositosEnGarantia"></td>
            </tr>
            <tr>
                <th class="thead">Monto depositos en garantía</th>
                <td name="montoDepositosEnGarantia"></td>
            </tr>
            <tr>
                <th class="thead">Guardias</th>
                <td name="guardias"></td>
            </tr>
            <tr>
                <th class="thead">Cantidad guardias</th>
                <td name="cantidadGuardias"></td>
            </tr>
            <tr>
                <th class="thead">Monto guardias</th>
                <td name="montoGuardias"></td>
            </tr>
            <tr>
                <th class="thead">Método pago</th>
                <td name="metodoPago"></td>
            </tr>
            <tr>
                <th class="thead">Cuenta Bancaria</th>
                <td name="cuentaBancaria"></td>
            </tr>
            <tr>
                <th class="thead">Banco</th>
                <td name="banco"></td>
            </tr>
            <tr>
                <th class="thead">Total evento</th>
                <td name="totalEvento"></td>
            </tr>
            <tr>
                <th class="thead">Anticipo</th>
                <td name="anticipo"></td>
            </tr>
            <script src="<?= $pathJS ?>forms.js"></script>
        </table>
    </div>
</body>
</html>