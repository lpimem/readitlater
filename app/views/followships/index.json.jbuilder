json.array!(@followships) do |followship|
  json.extract! followship, :id
  json.url followship_url(followship, format: :json)
end
