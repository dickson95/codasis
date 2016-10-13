json.array!(@types) do |typ|
  json.extract! typ, :id, :name
  json.url typ_url(typ, format: :json)
end
