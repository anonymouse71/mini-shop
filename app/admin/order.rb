ActiveAdmin.register Order do

  menu false
  actions :index, :show
  ####<$ Scope List $>####
  scope :all, :default => true

  scope :new do |orders|
    orders.where('order_status =?', Order::STATUS[:new])
  end

  scope :shipped do |orders|
    orders.where('order_status =?', Order::STATUS[:shipped])
  end

  scope :canceled do |orders|
    orders.where('order_status =?', Order::STATUS[:canceled])
  end

  scope :confirmed do |orders|
    orders.where('order_status =?', Order::STATUS[:confirmed])
  end


  ####<$ Strong Parameter $>####
  permit_params :user_id, :cart_id, :order_status, :order_date, :order_total, :shipping_address,
                :message_by_customer, :comment_by_admin, :shipping_cost


  index do
    selectable_column
    id_column
    column :user
    column :order_status do |order|
      status_tag(order.order_status)
    end
    column :order_date
    actions
  end

  show do
    attributes_table do
      row :user
      row :order_status do |order|
        status_tag(order.order_status)
      end
      row :order_date
      row :order_total
      row :message_by_customer
      row :comment_by_admin
    end

    panel "Items" do
      table_for(order.order_details) do |t|
        t.column("Image")  {|item| auto_link image_tag item.product.product_photos.first.image_url(:thumb_small), :width => 50, :height => 60}
        t.column("Product") {|item| auto_link item.product}
        t.column("Quantity") {|item| item.quantity}
        t.column("Price")   {|item| to_bdt item.product_price }
        tr :class => "odd" do
          td ""
          td ""
          td "Total:", :style => "text-align: right;"
          td to_bdt(order.order_total)
        end
      end
    end

    panel "Shipment Details" do
        attributes_table_for order.shipment do
          row('Status') { status_tag order.shipment.status if status_tag order.shipment.status.present? }
          row('Shipping Date') {  order.shipment.shipping_date.strftime("%d-%m-%Y") if order.shipment.shipping_date.present? }
          row('First Name') { order.shipment.first_name }
          row('Last Name') { order.shipment.last_name }
          row('Email') { order.shipment.email }
          row('Company') { order.shipment.company }
          row('Address') { order.shipment.address }
          row('City') {  order.shipment.city }
          row('State') {  order.shipment.state }
          row('Zip Code') {  order.shipment.zip_code }
          row('Country') {  order.shipment.country }
          row('Additional Information') { order.shipment.additional_information if order.shipment.additional_information.present? }
          row('Mobile Phone') { order.shipment.mobile_phone if order.shipment.mobile_phone.present? }
        end
    end

    panel "Billing Details" do
      attributes_table_for order.billing_detail do
        row('First Name') { order.billing_detail.first_name }
        row('Last Name') { order.billing_detail.last_name }
        row('Email') { order.billing_detail.email }
        row('Company') { order.billing_detail.company }
        row('Address') { order.billing_detail.address }
        row('City') {  order.billing_detail.city }
        row('State') {  order.billing_detail.state }
        row('Zip Code') {  order.billing_detail.zip_code }
        row('Country') {  order.billing_detail.country }
        row('Additional Information') { order.billing_detail.additional_information if order.billing_detail.additional_information.present? }
        row('Mobile Phone') { order.billing_detail.mobile_phone if order.billing_detail.mobile_phone.present? }
      end
    end
  end


  sidebar :payment_details, :only => :show do
    attributes_table_for order.payment do
      row('Payment Type') { order.payment.payment_type }
      row('Status') {  order.payment.status if order.payment.status.present? }
      row('Transaction Number') {  order.payment.transaction_number if order.payment.transaction_number.present? }
      row('Amount') {  order.payment.amount if  order.payment.amount.present? }
      row('Transaction Mobile Number') {  order.payment.transaction_mobile_number if order.payment.transaction_mobile_number.present? }
    end
  end
  ####<$ Filter $>####
  filter :user
  filter :order_status
  filter :order_date

end
