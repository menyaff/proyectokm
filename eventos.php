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
                <th class="thead">nombre</th>
                <td name="nombre"></td>
            </tr>
            <tr>
                <th class="thead">cotizacion</th>
                <td name="cotizacion"></td>
            </tr>
            <tr>
                <th class="thead">statusCotizacion</th>
                <td name="statusCotizacion"></td>
            </tr>
            <tr>
                <th class="thead">statusEvento</th>
                <td name="statusEvento"></td>
            </tr>
            <tr>
                <th class="thead">cliente</th>
                <td name="cliente"></td>
            </tr>
            <tr>
                <th class="thead">lugar</th>
                <td name="lugar"></td>
            </tr>
            <tr>
                <th class="thead">tipo</th>
                <td name="tipo"></td>
            </tr>
            <tr>
                <th class="thead">fechaEntrega</th>
                <td name="fechaEntrega"></td>
            </tr>
            <tr>
                <th class="thead">fechaSeguimiento</th>
                <td name="fechaSeguimiento"></td>
            </tr>
            <tr>
                <th class="thead">fechaFinal</th>
                <td name="fechaFinal"></td>
            </tr>
            <tr>
                <th class="thead">direccion</th>
                <td name="direccion"></td>
            </tr>
            <tr>
                <th class="thead">invitados</th>
                <td name="invitados"></td>
            </tr>
            <tr>
                <th class="thead">salon</th>
                <td name="salon"></td>
            </tr>
            <tr>
                <th class="thead">vendedor</th>
                <td name="vendedor"></td>
            </tr>
            <tr>
                <th class="thead">utilidadCuenta</th>
                <td name="utilidadCuenta"></td>
            </tr>
            <tr>
                <th class="thead">cuenta</th>
                <td name="cuenta"></td>
            </tr>
            <tr>
                <th class="thead">montoServicios</th>
                <td name="montoServicios"></td>
            </tr>
            <tr>
                <th class="thead">depositosEnGarantia</th>
                <td name="depositosEnGarantia"></td>
            </tr>
            <tr>
                <th class="thead">montoDepositosEnGarantia</th>
                <td name="montoDepositosEnGarantia"></td>
            </tr>
            <tr>
                <th class="thead">guardias</th>
                <td name="guardias"></td>
            </tr>
            <tr>
                <th class="thead">cantidadGuardias</th>
                <td name="cantidadGuardias"></td>
            </tr>
            <tr>
                <th class="thead">montoGuardias</th>
                <td name="montoGuardias"></td>
            </tr>
            <tr>
                <th class="thead">metodoPago</th>
                <td name="metodoPago"></td>
            </tr>
            <tr>
                <th class="thead">cuentaBancaria</th>
                <td name="cuentaBancaria"></td>
            </tr>
            <tr>
                <th class="thead">banco</th>
                <td name="banco"></td>
            </tr>
            <tr>
                <th class="thead">totalEvento</th>
                <td name="totalEvento"></td>
            </tr>
            <tr>
                <th class="thead">anticipo</th>
                <td name="anticipo"></td>
            </tr>
            <script src="<?= $pathJS ?>forms.js"></script>
        </table>
    </div>
</body>
</html>

e.nombre
e.cotizacion
csc.nombre AS statusCotizacion
cse.nombre AS statusEvento
c.nombre AS cliente
cl.nombre AS lugar
cte.nombre AS tipo
e.fechaEntrega
e.fechaSeguimiento
e.fechaFinal
e.direccion
e.invitados
e.salon
emp.nombre AS vendedor
e.utilidadCuenta
e.cuenta
e.montoServicios
e.depositosEnGarantia
e.montoDepositosEnGarantia
cg.nombre AS guardias
e.cantidadGuardias
e.montoGuardias
cmp.nombre AS metodoPago
cb.nombre AS cuentaBancaria
b.nombre AS banco
e.totalEvento
e.anticipo
FROM eventos e