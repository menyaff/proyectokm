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
        librerias::numeral();
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
                        templateID,
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
                            width: 180
                        },
                        {
                        title: "",
                        filterable: false,
                        template: "<button type='button' id='btnEstadoDeCuenta_#: id #' registro='#: id #' class='btnEstadoDeCuenta btn btn-default' title='Estado de cuenta' value='Estado de cuenta'/><span class='fa fa-file-text' aria-hidden='true'></span></button>&nbsp;&nbsp;<button type='button' id='btnGridEditar_#: id #' registro='#: id #' class='btnFormPopup btn btn-default' title='Editar' value='Editar'><span class='fa fa-pencil' aria-hidden='true'></span></button>&nbsp;&nbsp;<button type='button' id='btnGridEliminar_#: id #' registro='#: id #' class='btnGridEliminar btn btn-default' title='Eliminar' value='Eliminar'><span class='fa fa-trash' aria-hidden='true' style='margin: 0px 0.5px;'></span></button>",
                        width: 160,
                        attributes: {
                            style: "text-align: center"
                        }
                    }
                    ];
        modal = "#divModal"; 
        grid = "#divGrid";  
        titulo = "cuenta bancaria";

        WS =  "<?= $pathWS ?>WS_cuentasBancarias.php";

        generaEstadoDeCuenta = function(registro, inicio, fin){
            var data = {};

            data["hdnId"] = registro;

            if(inicio!==undefined)
                data["iFechaIni"] = inicio;
            if(fin!==undefined)
                data["iFechaFin"] = fin;

            $.ajax({
                url: WS+"?accion=estadoDeCuenta",   
                data: data,
                type: "POST",
                dataType: "JSON",
                async: true,
                success: function(info){
                    if(info.respuesta=="TRUE"){
                        var htmlStr = "<span class='titulo'>"+info.contenido["cuentaBancaria"]["nombre"]+"</span>"+
                                    "&nbsp;&nbsp;&nbsp;<span class='titulo'>"+moneda(info.contenido["cuentaBancaria"]["saldo"])+"</span>"+
                                    "<br /><span class='titulo'>Banco:</span> "+info.contenido["cuentaBancaria"]["banco"]+
                                    "&nbsp;<span class='titulo'>Cuenta:</span> "+info.contenido["cuentaBancaria"]["noCuenta"]+
                                    "&nbsp;<span class='titulo'>CLABE:</span> "+info.contenido["cuentaBancaria"]["clabe"]+
                                    "<br /><br /><div class='row'><div class='col-lg-3 col-md-3 col-sm-3'><input type='text' id='iFechaIni' placeholder='Fecha inicio' value='"+(inicio!==undefined?inicio:"")+"' /></div>"+
                                    "<div class='col-lg-3 col-md-3 col-sm-3'><input type='text' id='iFechaFin' placeholder='Fecha final' value='"+(fin!==undefined?fin:"")+"' /></div>"+
                                    "<div class='col-lg-3 col-md-3 col-sm-3'><input type='button' id='btnFiltrarEstadoDeCuenta' class='btn btn-default' value='Filtrar' /></div></div>"+
                                    "<table class='table table-striped'>"+
                                    "<tr><th>FECHA</th><th>CONCEPTO</th><th>CARGOS</th><th>ABONOS</th></tr>";
                                
                        var cargos=0, abonos=0;

                        $(info.contenido["movimientos"]).each(function(){
                            var registro = $(this)[0];

                            if(registro["monto"]!=null){
                                htmlStr += "<tr><td>"+registro["fecha"]+"</td><td>"+registro["concepto"]+"</td>";

                                switch(registro["movimiento"]){
                                    case "GASTO":
                                        htmlStr += "<td>"+moneda(registro["monto"])+"</td><td>&nbsp;</td>";
                                        cargos += parseFloat(registro["monto"]);
                                        break;
                                    case "COBRO":
                                        htmlStr += "<td>&nbsp;</td><td>"+moneda(registro["monto"])+"</td>";
                                        abonos += parseFloat(registro["monto"]);
                                        break;
                                }

                                htmlStr += "</tr>";
                            }
                        });

                        htmlStr += "<tr class='success'><th colspan='2'>TOTAL</th><th>"+moneda(cargos)+"</th><th>"+moneda(abonos)+"</th></tr></table>";

                        $("#divEstadoDeCuenta").html(htmlStr);
                        $("#iFechaIni, #iFechaFin").kendoDatePicker({
                            format: "yyyy/MM/dd"
                        });

                        $("#btnFiltrarEstadoDeCuenta").unbind("click").click(function(event){
                            event.stopPropagation();

                            var fechaIni=$("#iFechaIni").val()=="" ? undefined : fechaIni=$("#iFechaIni").val(), fechaFin=$("#iFechaFin").val()=="" ? undefined : $("#iFechaFin").val();

                            if(fechaIni!==undefined || fechaFin!==undefined)
                                generaEstadoDeCuenta(registro,fechaIni,fechaFin);
                        });

                        $("#divEstadoDeCuenta").data("kendoWindow").open();
                    }else
                        $.notify(info.mensaje,"error");
                },
                error: function(info){
                    console.error(info);
                }
            });
        };

        $(document).ready(function(){
            $(modal).setModal(titulo, 550);
            $(grid).setGrid();
            $("#divEstadoDeCuenta").setModal("Estado de cuenta",1050,true);
            $(grid).setGrid();
            $("#selBancos").rellenaSelect("<?= $pathWS ?>WS_bancos.php");

            $(".btnEstadoDeCuenta").click(function(){
                var elem = $(this);

                generaEstadoDeCuenta(elem.attr("registro"));
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
                <select name="id_banco" id="selBancos" class="form-control form-md">
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