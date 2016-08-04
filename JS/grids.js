templateID = {
                    field: "id",
                    title: "&nbsp;",
                    filterable: false,
                    width: 50,
                    template: "<input type='checkbox' id='chGridRegistro_#: id #' registro='#: id #' class='chGridRegistro' />"
                };
templateBotones = {
                        title: "",
                        filterable: false,
                        template: "<button type='button' id='btnGridEditar_#: id #' registro='#: id #' class='btnFormPopup btn btn-default' title='Editar' value='Editar'><span class='fa fa-pencil' aria-hidden='true'></span></button>&nbsp;&nbsp;<button type='button' id='btnGridDetalles_#: id #' registro='#: id #' class='btnFormDetalles btn btn-default' title='Detalles' value='Detalles'><span class='fa fa-info' aria-hidden='true' style='margin: 2px 3.5px;'></span></button>&nbsp;&nbsp;<button type='button' id='btnGridEliminar_#: id #' registro='#: id #' class='btnGridEliminar btn btn-default' title='Eliminar' value='Eliminar'><span class='fa fa-trash' aria-hidden='true' style='margin: 0px 0.5px;'></span></button>",
                        width: 160,
                        attributes: {
                            style: "text-align: center"
                        }
                    };

selRegistros = function(){
	var totalRegistros = $(".chGridRegistro").length;
	var registrosSeleccionados = $(".chGridRegistro:checked").length;

	if(registrosSeleccionados < totalRegistros)
		$(".chGridRegistro").prop("checked",true);
	else
		$(".chGridRegistro").prop("checked",false);

	activaBtnEliminar();
};
activaBtnEliminar = function(){
	var totalRegistros = $(".chGridRegistro").length;
	var registrosSeleccionados = $(".chGridRegistro:checked").length;

	if(registrosSeleccionados > 0)
		$("#btnGridEliminar").removeAttr("disabled");
	else
		$("#btnGridEliminar").attr("disabled","disabled");

	if(registrosSeleccionados == totalRegistros)
		$("#chGridTodos").prop("checked",true);
	else
		$("#chGridTodos").prop("checked",false);
};
confirmaEliminar = function(funcion, singular){
	singular = singular==undefined ? true : false;

	var mensajeEliminar = singular ? "el registro" : "los registros";
	var idModalConfirmacion = "modalConfirmaEliminar";

	var modalConfirmacion = "<div id='"+idModalConfirmacion+"'>¿Desea eliminar "+mensajeEliminar+"?<br /><br /><input type='button' id='btnSiElimina' class='btn btn-default' value='Si' />&nbsp;&nbsp;<input type='button' id='btnNoElimina' class='btn btn-default' value='No' />";

	$("body").append(modalConfirmacion);

	$("#"+idModalConfirmacion).kendoWindow({
        modal: true,
        draggable: false,
        resizable: false,
        width: 200,
        close: function(){
        	$("#"+idModalConfirmacion).data("kendoWindow").destroy();
        	$("#"+idModalConfirmacion).remove();
        }
    }).data("kendoWindow").center();

    $("#btnSiElimina, #btnNoElimina").unbind("click");
    $("#btnSiElimina").click(function(elem){
    	elem.stopPropagation();

    	$(funcion);
    	$("#"+idModalConfirmacion).data("kendoWindow").close();
    });
    $("#btnNoElimina").click(function(elem){
    	elem.stopPropagation();

    	$("#"+idModalConfirmacion).data("kendoWindow").close();
    });
};

(function($){
	$.fn.extend({
		setModal : function(titulo, width, informacion){
			var elem = $(this);

			elem.attr("titulo",titulo);

            $(elem).kendoWindow({
            	title: titulo,
            	animation: {
					open: {
						duration: 500
					},
					close: {
						duration: 300
					}
				},
                visible: false,
                modal: true,
                draggable: false,
                resizable: false,
                width: width,
                actions: ["Close"],
                close: function(){
                	if(informacion===undefined){
	                	$(modal).find("input[type='reset']").click();
	                	$(modal).find("#hdnId").val("0");
	                	$(modal).find(".selDependiente").find("option[value!='']").remove();
	                }
                }
            }).data("kendoWindow").center();
		},
		setGrid : function(accion, bound){
			var elem = $(this);

			$(elem).kendoGrid({
		        dataSource: {
		            transport: {
		                read: {
		                    url: WS+"?accion="+(accion==undefined?"select":accion),
		                    dataType: "json"
		                }
		            },
		            schema: {
		                model: {
		                    fields: jsonFields
		                }
		            }                
		        },
		        toolbar: "<div class=\"gridToolbar\"><div id=\"left\"><input type='checkbox' id='chGridTodos' />&nbsp;Todos</div><div id=\"right\"><button type='button' id='btnGridEliminar' class='btn btn-default' disabled title='Eliminar' value='Eliminar'><i class='fa fa-trash' aria-hidden='true'></i></button>&nbsp;&nbsp;<button type='button' id='btnGridNuevo' class='btnFormPopup btn btn-default' title='Nuevo' value='Nuevo'><i class='fa fa-plus' aria-hidden='true'></i></button></div></div>",
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
		          pageSizes: [5,10,20,50],
		          buttonCount: 10
		        },
		        columns: jsonColumns,
		        dataBound: function(){
		        	var titulo = typeof(modal)=='undefined' ? "" : $(modal).data("kendoWindow").title();

		        	$(".btnFormPopup, .btnGridEliminar, #btnGridEliminar, #chGridTodos, .chGridRegistro, .btnFormDetalles").unbind("click");
		            $(".btnFormPopup, .btnFormDetalles").click(function(event){
		            	event.stopPropagation();
		            	var elem = $(this);

		                switch(elem.val()){
		                    case "Nuevo":
		                        $(modal).data("kendoWindow").title("Crear "+$(modal).attr("titulo")).open();
		                        break;
		                    case "Editar":
		                    	$(modal).inicializaInfo(WS,accion,elem.attr("registro"),false,function(){
		                        	$(modal).data("kendoWindow").title("Editar "+$(modal).attr("titulo"));
		                        });
		                        $(modal).data("kendoWindow").open();
		                        break;
		                    case "Detalles":
		                    	$(modalDetalles).inicializaInfo(WS,accion,elem.attr("registro"),true, function(){
		                    		$(modalDetalles).data("kendoWindow").title("Detalles de "+$(modalDetalles).attr("titulo"));
		                    	});
		                    	$(modalDetalles).data("kendoWindow").open();
		                    	break;
		                }
		            });
		            /*
		            $(".btnFormDetalles").click(function(event){
		            	event.stopPropagation();
		            	var elem = $(this);

		            	$(modalDetalles).inicializaInfo(WS,accion,elem.attr("registro"), function(){
                    		$(modalDetalles).data("kendoWindow").title("Detalles");
                    	});
                    	$(modalDetalles).data("kendoWindow").open();
		            });
		             */
		            $(".btnGridEliminar").click(function(event){
						event.stopPropagation();
		            	var elem = $(this);

						confirmaEliminar(function(){
							eliminaRegistro(elem.attr("registro"));
						});

		            });
		            $("#btnGridEliminar").click(function(event){
						event.stopPropagation();

						var registros = "";

						$(".chGridRegistro:checked").each(function(){
							var elem = $(this);

							registros += elem.attr("registro")+",";
						});

						registros = registros.substr(0,registros.length-1);

						confirmaEliminar(function(){
							eliminaRegistro(registros);
						});
		            });
					$("#chGridTodos").click(function(event){
						event.stopPropagation();

						selRegistros();
					});
					$(".chGridRegistro").click(function(event){
						event.stopPropagation();

						activaBtnEliminar();
					});
					
					if(bound!=undefined)
						$(bound);
		        }
		    }); 
		},
		refreshGrid : function(accion){
			var elem = $(this);

			elem.data("kendoGrid").destroy();
			elem.html("");
    		elem.setGrid(accion);
		}
	});
})(jQuery);