json.array!(@orders) do |order|
  json.extract! order, :id, :user_name, :address, :product_id, :quantity
  json.url order_url(order, format: :json)
end
