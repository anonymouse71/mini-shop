ActiveAdmin.register Shipment do

  menu false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


  ####<$ Strong Parameter $>####
  permit_params :order_id, :status, :shipping_date, :received_by_customer_date

  ####<$ Filter $>####
  filter :order_id
  filter :status
  filter :shipping_date
  filter :received_by_customer_date
end
