json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :cart_id, :order_status, :order_date, :order_total, :shipping_address, :message_by_customer, :comment_by_admin, :shipping_cost
  json.url order_url(order, format: :json)
end
