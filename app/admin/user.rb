ActiveAdmin.register User  do

  menu false

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show :title => :email do
    panel 'Order History' do
      table_for(user.orders) do
        column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
        column("State")                   {|order| status_tag(order.order_status) }
        column("Date", :sortable => :order_date){|order| pretty_format(order.order_date) }
        column("Total")                   {|order| to_bdt order.order_total }
      end
    end
  end

  sidebar "Customer Details", :only => :show do
    attributes_table_for user, :first_name, :last_name, :email, :created_at
  end

  sidebar "Order History", :only => :show do
    attributes_table_for user do
      row("Total Orders") { user.orders.count }
      row("Total Value") { to_bdt user.orders.sum(:order_total) }
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  ####<$ Filter $>####
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
end
