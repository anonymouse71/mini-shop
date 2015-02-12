json.array!(@billing_details) do |billing_detail|
  json.extract! billing_detail, :id, :order_id, :first_name, :last_name, :email, :company, :address, :city, :state, :zip_code, :country, :additional_information, :mobile_phone, :cart_id
  json.url billing_detail_url(billing_detail, format: :json)
end
