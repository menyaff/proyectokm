<?php
	require_once "config/front.conf";
?>
<!DOCTYPE html>
<html>
	<head>
		<title>KM &amp; Asociados</title>
		<meta charset="UTF-8" />
		<?php
			librerias::includeJQuery();
			librerias::includeKendo();
		?>
		<script type="text/javascript" languaje="javascript" src="JS/datos.js"></script>
		<script type="text/javascript" languaje="javascript">
			$("document").ready(function(){
				$("#divGrid").kendoGrid({
                    dataSource: {
                        data: info[0]['eventos'],
                        pageSize: 5
                    },
                    scrollable: true,
                    sortable: true,
                    filterable: {
                    	extra: false,
                  		messages: {
							filter: "Aplicar",
							clear: "Limpiar",
							info: "Mostrar registros con valor"
					    },
					    operators: {
					    	string: {
					    		eq: "Igual a",
					    		neq: "Diferente de",
					    		contains: "Contiene",
					    		isnull: "Nulo",
					    		isnotnull: "No nulo",
					    		isempty: "Vacio"
					    	},
					    	number: {
					    		eq: "Igual a",
					    		neq: "Diferente de",
					    		gt: "Mayor a",
					    		gte: "Mayor o igual a",
					    		lt: "Menor a",
					    		lte: "Menor o igual a",
					    		isnull: "Nulo",
					    		isnotnull: "No nulo",
					    		isempty: "Vacio"
					    	}
					    }
                    },
                    toolbar: [
                    	{template:"<div id='btnNuevoRegistro' class='k-button'><span class='k-icon k-add'></span>Nuevo registro</div>"},
                    	{template:"<div id='btnPDFGlobal' class='k-button btnPDF'><span class='k-icon k-pdf'></span>Reporte PDF</div>"}
                    ],
                    pageable: {
                        input: true,
                        numeric: true,
                        messages: {
                        	display: "{0} al {1} de {2} registros",
                        	empty: "Sin registros para mostrar",
                        	page: "Página",
                        	of: "de {0}",
                        	first: "Primer página",
                        	last: "Última página",
                        	next: "Siguiente página",
                        	previous: "Página anterior",
                        	morePages: "Más páginas"
                        }
                    },
                    columns: [
                        { field: "clave", title: "Clave", filterable: false, width: "70px" },
                        { field: "nombre", title: "Nombre" },
                        { field: "tipo", title: "Tipo" },
                        { field: "cliente", title: "Cliente" },
                        { field: "estatus", title: "Estatus" },
                        { field: "fechaEvento", title: "Fecha evento" },
                        { field: "fechaEntrega", title: "fechaEntrega" },
                        { field: "seguimiento", title: "Seguimiento" },
                        { 
                        	command: [
                        		{template:"<div class='btnEditaRegistro'><span class='k-icon k-edit'></span></div>"},
                        		{template:"<div class='btnEliminaRegistro'><span class='k-icon k-delete'></span></div>"},
                        		{template:"<div class='btnPDF'><span class='k-icon k-pdf'></span></div>"}
                        	], 
                        	title: "Acciones", 
                            width: "230px",
                            filterable: false
                    	},
                        {
                            command: {template:"<div class='k-button aEditaRegistro'><span class='k-icon k-search'></span>Consultar eventos</div>"},
                            title: "&nbsp;",
                            width: "200px",
                            filterable: false
                        }
                    ],
                    editable: false
                });

				$("#divEditaRegistro").kendoWindow({
					width: "230px",
                    title: "Información registro",
                    visible: false,
                    modal: true,
                    actions: [
                        "Pin",
                        "Close"
                    ]
                }).data("kendoWindow").center();

                $("#btnNuevoRegistro").click(function(){
                	$("#divEditaRegistro").data("kendoWindow").open();
                });
			});
		</script>
		<style type="text/css">
            .btnEditaRegistro, .btnEliminaRegistro, .btnPDF{
                min-width: 12px;
                width: 18px;
            }
			#divEditaRegistro .campoFormulario{
				margin-bottom: 5px;
				text-align: center;
				clear: both;
			}
			#divEditaRegistro .campoFormulario>input[type='text']{ 
				width: 100%;
				padding-left: 3px;
			}
		</style>
	</head>
	<body>
		<div id="divGrid"></div>
		<div id="divEditaRegistro">
			<div class="campoFormulario"><input type="text" class="k-input" id="iNombre" placeholder="Nombre" /></div>
			<div class="campoFormulario"><input type="text" class="k-input" id="iNComercial" placeholder="Nombre comercial" /></div>
			<div class="campoFormulario"><input type="button" class="k-button" id="btnAceptarEditaRegistro" value="Aceptar" /></div>
		</div>
	</body>
</html>