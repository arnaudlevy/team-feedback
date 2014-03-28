json.array!(@indicators) do |indicator|
  json.extract! indicator, :id, :label
  json.url indicator_url(indicator, format: :json)
end
