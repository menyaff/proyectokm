<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Cotizaciones</title>
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
    </script>
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
                            field: "status",
                            title: "Status"
                        },
                        {
                            field: "fechaEntrega",
                            title: "Fecha"
                        },
                        {   field: "vendedor",
                            title: "Vendedor"
                        },
                        {
                            title: "",
                            filterable: false,
                            template: "<input type='button' id='btnGridEditar_#: id #' registro='#: id #' class='btnEditarForm btn btn-default' value='Editar' />&nbsp;&nbsp;<input type='button' id='btnGridEliminar_#: id #' registro='#: id #' class='btnGridEliminar btn btn-default' value='Eliminar' />",
                            width: 180,
                            attributes: {
                                style: "text-align: center"
                        }
                    }
                    ];
        grid = "#divGrid";  
        WS = "<?= $pathWS ?>WS_eventos.php";

        $(document).ready(function(){
            $(grid).setGrid("selectCotizacion",function(){
                $(".btnEditarForm").unbind("click");
                $(".btnEditarForm").click(function(){
                    var registro = $(this).attr("registro");

                    window.location.href = "<?= __PathSitio__ ?>registraEvento.php?cotizacion="+registro;
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
</body>
</html>