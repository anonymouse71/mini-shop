ActiveAdmin.register Customer do

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
  permit_params :user_id, :full_name, :email, :phone, :address, :note

  ####<$ Filter $>####
  filter :user
  filter :full_name
  filter :email
  filter :phone

end
