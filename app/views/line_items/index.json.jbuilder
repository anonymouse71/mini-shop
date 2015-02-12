json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :cart_id, :product_id, :quantity, :product_price
  json.url line_item_url(line_item, format: :json)
end
