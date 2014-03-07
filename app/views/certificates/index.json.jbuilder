json.array!(@certificates) do |certificate|
  json.extract! certificate, :id, :user_id, :amount, :giver_id, :giver_name
  json.url certificate_url(certificate, format: :json)
end
