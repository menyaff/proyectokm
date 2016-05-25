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
                        data: info[0]['clientes'],
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
                    	{template:"<a id='aNuevoRegistro' class='k-button' href='\\#'>Nuevo registro</a>"},
                    	{template:"<a id='aPDFGlobal' class='k-button' href='\\#'>Reporte PDF</a>"}
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
                        { field: "clave", title: "Clave", filterable: false, width: "100px" },
                        { field: "nombre", title: "Nombre" },
                        { field: "comercial", title: "Nombre comercial" },
                        { 
                        	command: [
                        		{template:"<a class='k-button aEditaRegistro' href='\\#'>Editar</a>"},
                        		{template:"<a class='k-button aEliminaRegistro' href='\\#'>Eliminar</a>"},
                        		{template:"<a class='k-button aPDF' href='\\#'>PDF</a>"}
                        	], 
                        	title: "Acciones", width: "250px",
                            filterable: false
                    	},
                        {
                            command: {template:"<a class='k-button aEditaRegistro' href='\\#'>Consultar eventos</a>"},
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

                $("#aNuevoRegistro").click(function(){
                	$("#divEditaRegistro").data("kendoWindow").open();
                });
			});
		</script>
		<style type="text/css">
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