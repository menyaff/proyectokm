templateID = {
                    field: "id",
                    title: "ID",
                    filterable: false,
                    width: 100,
                    template: "<input type='checkbox' id='chGridRegistro_#: id #' registro='#: id #' class='chGridRegistro' />&nbsp;#: id #"
                };
templateBotones = {
                        title: "",
                        filterable: false,
                        template: "<input type='button' id='btnGridEditar_#: id #' registro='#: id #' class='btnFormPopup btn btn-default' value='Editar' />&nbsp;&nbsp;<input type='button' id='btnGridEliminar_#: id #' registro='#: id #' class='btnGridEliminar btn btn-default' value='Eliminar' />",
                        width: 200,
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
		setModal : function(titulo, width){
			var elem = $(this);

            $(elem).kendoWindow({
            	title: titulo,
                visible: false,
                modal: true,
                draggable: false,
                resizable: false,
                width: width,
                actions: ["Close"],
                close: function(){
                	$(modal).find("form")[0].reset();
                	effects: "fade:out";
                }
            }).data("kendoWindow").center();
		},
		setGrid : function(){
			var elem = $(this);

			$(elem).kendoGrid({
		        dataSource: {
		            transport: {
		                read: {
		                    url: WS+"?accion=select",
		                    dataType: "json"
		                }
		            },
		            schema: {
		                model: {
		                    fields: jsonFields
		                }
		            }                
		        },
		        toolbar: "<div class=\"gridToolbar\"><div id=\"left\"><input type='checkbox' id='chGridTodos' />&nbsp;Todos</div><div id=\"right\"><button id='btnGridEliminar' class='btn btn-default' disabled >Eliminar</button>&nbsp;&nbsp;<button id='btnGridNuevo' class='btnFormPopup btn btn-default'>Nuevo</button></div></div>",
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
		        columns: jsonColumns,
		        dataBound: function(){
		        	var titulo = $(modal).data("kendoWindow").title();

		            $(".btnFormPopup").click(function(event){
		            	event.stopPropagation();
		            	var elem = $(this);

		                switch(elem.val()){
		                    case "Nuevo":
		                        $(modal).data("kendoWindow").title("Crear "+titulo);
		                        break;
		                    case "Editar":
		                    	$(modal).inicializaInfo(WS, elem.attr("registro"));
		                        $(modal).data("kendoWindow").title("Editar "+titulo);
		                        break;
		                }
		                $(modal).data("kendoWindow").open();
		            });
		            $(".btnGridEliminar").click(function(event){
						event.stopPropagation();
		            	var elem = $(this);

						confirmaEliminar(function(){
							eliminaRegistro(elem.attr("registro"));
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
		        }
		    }); 
		},
		refreshGrid : function(){
			var elem = $(this);

			elem.data("kendoGrid").destroy();
			elem.html("");
    		elem.setGrid();
		}
	});
})(jQuery);