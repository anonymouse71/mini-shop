json.array!(@carts) do |cart|
  json.extract! cart, :id, :shipping_cost
  json.url cart_url(cart, format: :json)
end
