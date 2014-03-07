json.array!(@procedures) do |procedure|
  json.extract! procedure, :id, :name, :description
  json.url procedure_url(procedure, format: :json)
end
