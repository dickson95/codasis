json.array!(@valuationes) do |valuation|
  json.extract! valuation, :id, :good_min, :good_max, :level1, :image1, :vuln_min, :vuln_max, :level2, :image2, :low_min, :low_max, :level3, :image3, :low_min, :low_max, :level3, :image4
  json.url valuation_url(valuation, format: :json)
end
