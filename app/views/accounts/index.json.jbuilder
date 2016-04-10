json.array!(@accounts) do |account|
  json.extract! account, :id, :username, :password, :level
  json.url account_url(account, format: :json)
end
