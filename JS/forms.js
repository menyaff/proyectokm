eliminaRegistro = function(id){
	$.ajax({
		url: WS+"?accion=delete",	
		data: {"hdnId":id},
		type: "POST",
		dataType: "JSON",
		async: true,
		success: function(info){
			$(modal).data("kendoWindow").close();
			$(grid).refreshGrid();

			if(info.respuesta=="TRUE")
				$.notify(info.mensaje,"success");
			else
				$.notify(info.mensaje,"error");
		},
		error: function(info){
			console.error(info);
		}
	});
}
rellenaCampos = function(form, valores){
	form.find("input:text, input[type='number'], input[type='email'], input:hidden, input:radio, input:checkbox, select, textarea").each(function(){
		var campo = $(this);

		switch(campo.prop("tagName").toLowerCase()){
			case "input":
				switch(campo.attr("type").toLowerCase()){
					case "text":
					case "number":
					case "email":
					case "hidden":
						campo.val(valores[campo.attr("name")]);
						break;
					case "radio":
						if(valores[campo.attr("name")] == "1")
							form.find("input[name='"+campo.attr("name")+"'][value='"+valores[campo.attr("name")]+"']").prop("checked","checked");
						break;
					case "checkbox":
						if(valores[campo.attr("name")] == "1")
							campo.prop("checked","checked");
						break;
				}
				break;
			case "select":
				campo.find("option[selected]").removeAttr("selected");
				campo.find("option[value='"+valores[campo.attr("name")]+"']").attr("selected","selected");
				campo.val(valores[campo.attr("name")]);
				campo.change();
				break;
			case "textarea":
				campo.html(valores[campo.attr("name")]);
				break;
		}
	});
};
getFormJson = function(form){
	var retorno = {};

	form.find("input:text, input[type='number'], input[type='email'], input:password, input:hidden, input:radio, input:checkbox, select, textarea").each(function(){
		var campo = $(this);

		var tagName = campo.prop("tagName").toLowerCase();

		switch(tagName){
			case "input":
				if(tagName=="input" && campo.attr("type") == "checkbox")
					retorno[campo.attr("id")] = (campo.is(":checked") ? "TRUEb" : "FALSEb");
				else{
					var valor = campo.val();

					retorno[campo.attr("id")] = (campo.attr("type")=="number" && valor=="") ? "0" : valor;
				}
				break;
			case "select":
				var valor = campo.val();

				retorno[campo.attr("id")] = (valor == null ? 0 : parseInt(valor));
				break;
			case "textarea":
				retorno[campo.attr("id")] = campo.html();
				break;
		}
	});

	return retorno;
};

(function($){
	$.fn.extend({
		inicializaInfo : function(WS, accion, registro, onDie){
			var elem = $(this);

			$.ajax({
				url: WS+"?accion="+(accion==undefined?"select":accion),	
				data: {hdnId:registro},
				type: "POST",
				dataType: "JSON",
				async: false,
				success: function(info){
					info = info[0];

					rellenaCampos(elem,info);
					$(onDie);
				}
			});
		},
		salvaInfo : function(accion,refresh){
			var elem = $(this);

			var data = getFormJson(elem);
			
			$.ajax({
				url: WS+"?accion="+(accion==undefined?"update":accion),
				data: data,
				type: "POST",
				dataType: "JSON",
				async: true,
				success: function(info){
					$(modal).data("kendoWindow").close();
					$(grid).refreshGrid(refresh);

					if(info.respuesta=="TRUE")
						$.notify(info.mensaje,"success");
					else{
						var msgError = info.mensaje == undefined ? "Ocurrió un error interno" : info.mensaje;

						$.notify(msgError,"error");
					}
				},
				error: function(info){
					console.error(info);
				}
			});
		},
		rellenaSelect : function(WS,filtro){
			var elem = $(this);
 
			filtro = filtro==undefined ? '{}' : filtro;

			elem.find("option[value!='']").remove();

			$.ajax({
				url: WS+"?accion=select",	
				type: "POST",
				data: filtro,
				dataType: "JSON",
				async: false,
				success: function(info){
					if(info[0]!=undefined && info[0].respuesta!="FALSE")
						$.each(info, function(){
							var opcion = $(this)[0];

							elem.append("<option value='"+opcion.id+"'>"+opcion.nombre+"</option>");
						});
				},
				error: function(info){
					console.error(info);
				}
			});
		}
	});
})(jQuery);

$(document).ready(function(){
	$("form").submit(function(){
		var elem = $(this);
		
		$(elem).salvaInfo();

		return false;
	});
	$("form input[type='reset']").click(function(){
		var elem = $(this).parents("form");

		$(elem).find("select>option[selected]").removeAttr("selected");
		$(elem).find("select>option[value='']").attr("selected","selected");
        $(elem).find(".selDependiente").find("option[value!='']").remove();

		return true;
	});
});