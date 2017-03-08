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
	obtener_ids = (table, persona)->
		ids = []
		body = table.find("tbody")
		$.each body.children("tr"), (i, v) ->
			$("#evento_persona_"+persona.id).remove()
			input = $("<input/>").attr(
				{
					multiple: 'multiple',
					value: persona.id,
					id: 'evento_persona_'+persona.id,
					type: 'hidden', 
					name: 'evento[persona_ids][]'
				}
				)
			table.parent().append(input)
			
		return ids
	
	# Evento para remover las personas de la tabla
	$("body").on "click", ".eliminar", ->
		tr = $(this).closest("tr")
		$("#evento_persona_"+tr.attr("id")).remove()
		tr.remove()
	
	$("body").on "keydown keyup", "#persona_datos", (e)->
		val = $(this).val()
		$this = $(this)
		$.ajax(
			url: "/personas/buscar_persona?codigo="+val+"&documento="+val,
			success:(data, status, xhr)->
				if data
					persona_id = data.id
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
					tr = $("<tr id='"+persona_id+"'>").append(
							$("<td>").text(data.hora),
							$("<td>").text(data.nombres),
							$("<td>").text(data.documento),
							$("<td>").text(data.codigo),
							$("<td>").text(data.cargo_id),
							$("<td>").append(button)
						)
					$("tr#"+persona_id).remove()
					table.find("tbody").append(tr)
					ids = obtener_ids(table, data)
					$this.val("")
					$("#evento_persona_ids").val(ids)
			)
		if event.keyCode == 13
	        return false
	return
	