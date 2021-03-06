ActiveAdmin.register OrderDetail do

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
  permit_params :product_id, :order_id, :quantity, :product_price

  ####<$ Filter $>####
  filter :order_id, as: :string
  filter :product

end
