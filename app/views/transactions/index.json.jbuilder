json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :group_id
  json.url transaction_url(transaction, format: :json)
end
