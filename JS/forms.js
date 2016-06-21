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
						form.find("input[name='"+campo.attr("name")+"'][value='"+valores[campo.attr("name")]+"']").prop("checked",true);
						break;
					case "checkbox":
						campo.prop("checked",valores[campo.attr("name")]);
						break;
				}
				break;
			case "select":
				campo.find("option[selected]").removeAttr("selected");
				campo.find("option[value='"+valores[campo.attr("name")]+"']").attr("selected","selected");
				break;
			case "textarea":
				campo.html(valores[campo.attr("name")]);
				break;
		}
	});
};
getFormJson = function(form){
	var retorno = '{';

	form.find("input:text, input[type='number'], input[type='email'], input:password, input:hidden, input:radio, input:checkbox, select, textarea").each(function(){
		var campo = $(this);
		var tagName = campo.prop("tagName").toLowerCase();

		retorno += '"'+campo.attr("id")+'":';

		switch(tagName){
			case "input":
			case "select":
				if(tagName=="input" && campo.attr("type") == "checkbox")
					retorno += (campo.is(":checked") ? 'TRUE' : 'FALSE') +',';
				else
					retorno += '"'+campo.val()+'",';
				break;
			case "textarea":
				retorno += '"'+campo.html()+'",';
				break;
		}
	});

	retorno = retorno.substr(0,retorno.length-1) + '}';

	return $.parseJSON(retorno);
};

(function($){
	$.fn.extend({
		inicializaInfo : function(WS, registro){
			var elem = $(this);

			$.ajax({
				url: WS+"?accion=select",	
				data: {hdnId:registro},
				type: "POST",
				dataType: "JSON",
				async: true,
				success: function(info){
					info = info[0];

					rellenaCampos(elem,info);
				}
			});
		},
		salvaInfo : function(){
			var elem = $(this);

			var data = getFormJson(elem);
			
			$.ajax({
				url: WS+"?accion=update",	
				data: data,
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
				async: true,
				success: function(info){
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
	$(modal).find("form").submit(function(){
		$(modal).salvaInfo();

		return false;
	});
	$(modal).find("form input[type='reset']").click(function(){
		$(modal).find("select>option:selected").removeAttr("selected");
		$(modal).find("select>option[value='']").attr("selected","selected");

		return true;
	});
});