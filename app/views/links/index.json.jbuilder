json.array!(@links) do |link|
  json.extract! link, :id, :url, :title, :description, :level
  json.url link_url(link, format: :json)
end
