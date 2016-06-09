<?php
    require_once "config/front.conf";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Subfamilias</title>
    <?php
        metatags();

        librerias::JQuery();
        librerias::Kendo();
        librerias::notify();
        librerias::FontAwesome();
        librerias::Bootstrap();

        echo "<link type='text/css' rel='stylesheet' href='".$pathCSS."main.css' />\n
            <link type='text/css' rel='stylesheet' href='".$pathCSS."formularios.css' />";
    ?>
    <style type="text/css">
        #divFormSubfamilias{ display: none; }
    </style>
    <script>
        $(document).ready(function(){
            $("#divFormSubfamilias").kendoWindow({
                visible: false,
                modal: true,
                draggable: false,
                resizable: false,
                width: 550,
                actions: ["Close"]
            }).data("kendoWindow").center();
            $("#divGrid").kendoGrid({
                dataSource: {
                    transport: {
                        read: {
                            url: "<?= $pathWS ?>WS_subfamilias.php?accion=select",
                            dataType: "json"
                        }
                    },
                    schema: {
                        model: {
                            fields: {
                                id: { type: "number" },
                                nombre: { type: "string" }
                            }
                        }
                    }                
                },
                toolbar: "<div><input type='checkbox' id='chTodosSubfamilias' />&nbsp;Todos&nbsp;&nbsp;<input type='button' id='btnGridNuevo' class='btnFormPopup btn btn-default' value='Nuevo' />&nbsp;&nbsp;<input type='button' id='btnGridEliminar' class='btn btn-default' value='Eliminar' /></div>",
                filterable: {
                    messages: {
                        info: "Muestra elementos con valor",
                        and: "y",
                        or: "o",
                        filter: "Aplicar",
                        clear: "Limpiar"
                    },
                    operators: {
                        string: {
                            eq: "Igual a",
                            neq: "Diferente de",
                            isempty: "Vacio",
                            startswith: "Inicia con",
                            endswith: "Termina con",
                            contains: "Contiene",
                            doesnotcontain: "No contiene"
                        }
                    }
                },
                sortable: true,
                pageable: {
                  messages: {
                      display: "{0} a {1} de {2} registros",
                      first: "Ir a la primer página",
                      previous: "Ir a la página anterior",
                      next: "Ir a la siguiente página",
                      last: "Ir a la última página",
                      morePages: "Mas páginas",
                      empty: "Sin registros disponibles",
                      itemsPerPage: "Registros por página"
                  },
                  pageSize: 5,
                  pageSizes: [10,20,50],
                  buttonCount: 10
                },
                columns: [{
                        field: "id",
                        title: "ID",
                        filterable: false,
                        width: 100,
                        template: "<input type='checkbox' id='chSubfamilia_#: id #' registro='#: id #' class='chSubfamiliasGrid' />&nbsp;#: id #"
                    },
                    {

                        field: "nombre",
                        title: "Nombre"
                    },
                    {
                        title: "",
                        filterable: false,
                        template: "<input type='button' id='btnGridEditar_#: id #' registro='#: id #' class='btnFormPopup btn btn-default' value='Editar' />&nbsp;&nbsp;<input type='button' id='btnGridEliminar_#: id #' registro='#: id #' class='btnGridEliminar btn btn-default' value='Eliminar' />",
                        width: 200,
                        attributes: {
                            style: "text-align: center"
                        }
                    }
                ],
                dataBound: function(){
                    $(".btnFormPopup").click(function(){
                        switch($(this).val()){
                            case "Nuevo":
                                $("#divFormSubfamilias").data("kendoWindow").title("Crear subfamilia");
                                break;
                            case "Editar":
                                $("#divFormSubfamilias").data("kendoWindow").title("Editar subfamilia");
                                break;
                        }
                        $("#divFormSubfamilias").data("kendoWindow").open();
                    });
                }
            }); 
        });
    </script>
</head>
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
                            Familias
                        </li>
                    </ol>
                </div>
            <!-- /mapa ubicación -->
                <div id="divGrid"></div>
            </div>
        </div>
    </div>
    <div id="divFormSubfamilias">
        <div class="form-group">
            <input type="text" class="form-control campoNombre" placeholder="Nombre" id="iNombre" />
            <input type="hidden" id="iId" value="0" />
        </div>
        <div class="text-center">
            <input type="button" class="btn btn-default" value="Aceptar" />
            &nbsp;
            <input type="reset" class="btn btn-default" value="Limpiar" />
        </div>
    </div>
</body>
</html>