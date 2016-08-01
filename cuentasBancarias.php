<?php require_once "config/front.conf"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Cuentas bancarias</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();
    ?>
    <style>
        #divEstadoDeCuenta span.titulo{
            font-weight: bold;
            font-size: 1.3em;
            margin-left: 10px;
        }
    </style>
    <script>
        templateID = "";
        templateBotones = "";
    </script>
    <script src="<?= $pathJS ?>forms.js"></script>
    <script src="<?= $pathJS ?>grids.js"></script>
    <script>
        jsonFields = {
                        nombre: { type: "string" },
                        saldo: { type: "string" }
                    };
        jsonColumns = [
                        {
                            field: "id",
                            title: "ID",
                            filterable: false,
                            width: 70,
                            template: "<input type='checkbox' id='chGridRegistro_#: id #' registro='#: id #' class='chGridRegistro' />&nbsp;#: id #"
                        },
                        {
                            field: "nombre",
                            title: "Nombre"
                        },
                        {
                            field: "banco",
                            title: "Banco"
                        },
                        {
                            field: "saldo",
                            title: "Saldo",
                            template: "$#: saldo #",
                            width: 150
                        },
                        {
                        title: "",
                        filterable: false,
                        template: "<input type='button' id='btnEstadoDeCuenta_#: id #' registro='#: id #' class='btnEstadoDeCuenta btn btn-default' value='Estado de cuenta' />&nbsp;&nbsp;<input type='button' id='btnGridEditar_#: id #' registro='#: id #' class='btnFormPopup btn btn-default' value='Editar' />&nbsp;&nbsp;<input type='button' id='btnGridEliminar_#: id #' registro='#: id #' class='btnGridEliminar btn btn-default' value='Eliminar' />",
                        width: 320,
                        attributes: {
                            style: "text-align: center"
                        }
                    }
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";
        WS =  "<?= $pathWS ?>WS_cuentasBancarias.php";

        $(document).ready(function(){
            $(modal).setModal("cuenta bancaria", 550);
            $("#divEstadoDeCuenta").setModal("Estado de cuenta",800,true);
            $(grid).setGrid();
            $("#selBancos").rellenaSelect("<?= $pathWS ?>WS_bancos.php");

            $(".btnEstadoDeCuenta").click(function(){
                var elem = $(this);

                $.ajax({
                    url: WS+"?accion=estadoDeCuenta",   
                    data: {"hdnId":elem.attr("registro")},
                    type: "POST",
                    dataType: "JSON",
                    async: true,
                    success: function(info){
                        if(info.respuesta=="TRUE"){
                            var htmlStr = "<span class='titulo'>"+info.contenido["cuentaBancaria"]["nombre"]+"</span> <br /><span class='titulo'>Banco:</span> "+info.contenido["cuentaBancaria"]["banco"]+"&nbsp;<span class='titulo'>Cuenta:</span> "+info.contenido["cuentaBancaria"]["noCuenta"]+"&nbsp;<span class='titulo'>CLABE:</span> "+info.contenido["cuentaBancaria"]["clabe"];

                            $("#divEstadoDeCuenta").html(htmlStr);

                            $("#divEstadoDeCuenta").data("kendoWindow").open();
                        }else
                            $.notify(info.mensaje,"error");
                    },
                    error: function(info){
                        console.error(info);
                    }
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
    <div id="divEstadoDeCuenta"></div>
    <div id="divModal" class="formPopup">
        <form method="post">
            <div class="form-group">
                <input type="hidden" name="id" id="hdnId" value="0"/>
                <input type="text" name="clave" id="iClave" class="form-control form-md" placeholder="Clave">
            </div>
            <div class="form-group">
                <input type="text" name="nombre" id="iNombre" class="form-control form-md" placeholder="Nombre">
            </div>
            <div class="form-group">
                <select name="banco" id="selBancos" class="form-control form-md">
                    <option value="" selected disabled>Bancos...</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="noCuenta" id="iNoCuenta" class="form-control form-md" placeholder="N&uacute;mero de cuenta">
            </div>
            <div class="form-group">
                <input type="text" name="clabe" id="iClabe" class="form-control form-md" placeholder="Clabe">
            </div>
            <div class="form-group">
                <input type="number" step="any" name="saldo" id="iSaldo" class="form-control form-md" placeholder="Saldo">
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-default" value="Enviar" />
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
       </form>
    </div>
</body>
</html>