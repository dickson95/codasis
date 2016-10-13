json.array!(@asistencias) do |asistencia|
  json.extract! asistencia, :id, :fecha, :ciudad, :objetivo, :persona_id, :evento_id
  json.url asistencia_url(asistencia, format: :json)
end
