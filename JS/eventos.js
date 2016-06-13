$(document).ready(function(){
	/*var grid = $("#tblGridEventos").DataTable({
        "aLengthMenu": [[50,100, -1], [50,100, "Todo"]],
        "iDisplayLength": 50,
        "order": [],
        "bFilter": false,
        "oLanguage":{
        	"oPaginate":{
        		"sNext":"Siguiente",
        		"sPrevious":"Anterior"
        	},
    		"sEmptyTable":"Sin datos para mostrar",
    		"sLengthMenu":"Mostrar _MENU_ tuplas",
    		"sInfo": "Del _START_ al _END_ de _TOTAL_ registros",
    		"sInfoEmpty": "0 Registros encontrados"
        }
	});*/
	
	$.renderizaGridEventos();
	
	$("#btnActualizar").click(function(){
		//$.actualizaDataTable(grid,"ws/eventos.php",{"fn":"listaEventosGrid","proceso":$.urlParam("proceso")});
		var grid = $("#gridEventos").data("kendoGrid");
		
		grid.destroy();
		
		$.renderizaGridEventos();
	});
	
	//Intervalo de autoactualizaci�n del grid
	setInterval(function(){
		var grid = $("#gridEventos").data("kendoGrid");
		
		grid.destroy();
		
		$.renderizaGridEventos();
	},120000);
});
$.renderizaGridEventos = function(){
    $("#gridEventos").kendoGrid({
        dataSource: {
            transport: {
                read: {
                    url: "ws/eventos.php?fn=listaEventosGrid",
                    data: {"proceso":$.urlParam("proceso")},
                	dataType: "json"
                }
            },
            schema: {
                data: function (resp){
					return resp.info;
                },
                total: function(resp){
					return resp.total;
                },
                model: {                                
                    fields: {
                        id_evento: { type: "string" },
                        hora_inicio: { type: "string" },
                        hora_proceso: { type: "string" },
                        tiempo_transcurrido: { type: "string" },
                        id_cat_status: { type: "string" },
                        registros_a_procesar: { type: "string" },
                        registros_procesados: { type: "string" }
                    }
                }
            },
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true
        },
        toolbar: "<div><input type='checkbox' id='chTodosSubfamilias' />&nbsp;Todos&nbsp;&nbsp;</div>",
        filterable: false,
        sortable: true,
        resizable: true,
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
          pageSize: 50,
          pageSizes: [30,50,100,300,500],
          buttonCount: 10
        },
        columns: [{
                field: "id_evento",
                title: "ID Evento"
            },
            {
                field: "hora_inicio",
                title: "Fecha de inicio"
            }, 
            {
                field: "hora_proceso",
                title: "Fecha de proceso"
            }, 
            {
                field: "tiempo_transcurrido",
                title: "Tiempo transcurrido"
            }, 
            {
                field: "id_cat_status",
                title: "Status",
                template: "<span spnStatus='#: id_cat_status #' class='spnStatus' evento='#: id_evento #'>#: id_cat_status #</span>"
            }, 
            {
                field: "registros_a_procesar",
                title: "Registros a procesar"
            }, 
            {
                field: "registros_procesados",
                title: "Registros procesados"
            }
        ],
        dataBound: function(){
            $(".spnStatus[spnStatus='Activo']").append("<input type='button' class='btnTerminaEvento button tiny alert' value='Terminar' />");
            $(".btnTerminaEvento").each(function(){
                Obj = $(this);
                id = Obj.parent().attr("evento");
                
                $(this).attr("evento",id);
            });
            $(".btnTerminaEvento").unbind("click");
            $(".btnTerminaEvento").click(function(){
                $.ajax({
                        url: "ws/eventos.php?fn=finalizaEvento",
                        dataType: "JSON",
                        type: "POST",
                        data: {"idEvento":id},
                        success: function(data){
                            $("#btnActualizar").click();
                        },
                        error: function(e){
                            $.errorShow(e);
                        }
                    });
            });            
        }
    });
};