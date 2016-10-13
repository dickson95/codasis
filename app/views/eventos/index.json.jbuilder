json.array!(@eventos) do |evento|
  json.extract! evento, :id, :asunto, :fecha, :hora, :ubicacion
  json.url evento_url(evento, format: :json)
end
