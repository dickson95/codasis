json.array!(@personas) do |persona|
  json.extract! persona, :id, :hora, :nombres, :documento, :empresa, :email, :telefono, :codigo, :cargo_id, :usuario_id
  json.url persona_url(persona, format: :json)
end
