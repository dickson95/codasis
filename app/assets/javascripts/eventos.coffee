jQuery ->
$(document).on 'click', '.remove_fields', (event) ->
	$(this).prev('input[type=hidden]').val('1')
	$(this).closest('fieldset').hide()
	event.preventDefault()

$(document).on 'click', '.add_fields', (event) ->
	time = new Date().getTime()
	regexp = new RegExp($(this).data('id'), 'g')
	$(this).before($(this).data('fields').replace(regexp, time))
	event.preventDefault()

$(document).on "turbolinks:load", ->
	obtener_ids = (table, id=null)->
		ids = []
		body = table.find("tbody")
		$.each body.children("tr"), (i, v) ->
			$("#evento_persona_"+id).remove()
			input = $("<input/>").attr(
				{
					multiple: 'multiple',
					value: id,
					id: 'evento_persona_'+id,
					type: 'hidden', 
					name: 'evento[persona_ids][]'
				}
				)
			table.parent().append(input)
			
		return ids
	
	# Evento para remover las personas de la tabla
	$("body").on "click", ".eliminar", ->
		tr = $(this).closest("tr")
		tbody = tr.parent()
		$("#evento_persona_"+tr.attr("id")).remove()
		tr.remove()
		if tbody.find("tr").length == 0
			tr = $("<tr>").attr({id: "fila_vacia", class: "text-center"}).append(
					$("<td>").attr({colspan: 6}).text("No se han añadido personas a este evento")
				)
			tbody.append(tr)
			obtener_ids(tbody.parent())
		
	
	$("body").on "keydown keyup", "#persona_datos", (e)->
		val = $(this).val()
		$this = $(this)
		$.ajax(
			url: "/personas/buscar_persona?codigo="+val+"&documento="+val,
			success:(data, status, xhr)->
				if data.persona
					persona = data.persona
					persona_id = persona.id
					table = $("#evento_personas")
					table.find("tr#fila_vacia").remove()
					button = $("<button>").attr(
						{
							name: "button",
							type: "button",
							class: "clase-boton eliminar"
							}
						).append(
							$("<i>").attr({class: "fa fa-times fa-2x"})
							)
					tr = $("<tr>").attr({id: persona_id, class: "text-center"}).append(
							$("<td>").text(data.hora),
							$("<td>").text(persona.nombres),
							$("<td>").text(persona.documento),
							$("<td>").text(persona.codigo),
							$("<td>").text(data.cargo),
							$("<td>").append(button)
						)
					$("tr#"+persona_id).remove()
					table.find("tbody").append(tr)
					ids = obtener_ids(table, persona.id)
					$this.val("")
					$("#evento_persona_ids").val(ids)
			)
		if event.keyCode == 13
	        return false
	return
	