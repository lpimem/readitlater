json.array!(@reports) do |report|
  json.extract! report, :id, :reason
  json.url report_url(report, format: :json)
end
