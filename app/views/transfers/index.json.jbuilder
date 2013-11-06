json.array!(@transfers) do |transfer|
  json.extract! transfer, :user_id, :receiver_id, :amount, :email, :name, :split_option
  json.url transfer_url(transfer, format: :json)
end
