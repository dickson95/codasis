json.array!(@roles) do |rol|
  json.extract! rol, :id, :name
  json.url rol_url(rol, format: :json)
end
