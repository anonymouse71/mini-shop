class OrdersController < ApplicationController

  before_filter :check_cart_items
  before_filter :skip_checkout, :only => :checkout

  def checkout
    session[:return_url] = shipping_info_path
  end

  def shipping_info
    shipment = Shipment.find_by_cart_id(session[:cart_id])
    @shipment = shipment.present? ? shipment : Shipment.new
  end

  def billing_info
    billing_detail = BillingDetail.find_by_cart_id(session[:cart_id])
    @billing_detail = billing_detail.present? ? billing_detail : BillingDetail.new
  end

  def shipping_method
  end

  def payment_info
    payment  = Payment.find_by_cart_id(session[:cart_id])
    @payment = payment.present? ? payment : Payment.new
  end

  def review_order
    @cart_items = LineItem.where(:cart_id => session[:cart_id])
  end

  def confirm_order
    order = Order.new
    cart  = Cart.find(session[:cart_id])
    cart_total = cart.cart_total.present? ? cart.cart_total : 0
    shipping_cost = cart.shipping_cost.present? ? cart.shipping_cost : 0

    order.user_id = current_user.id if current_user.present?
    order.cart_id = cart.id
    order.order_status = Order::STATUS[:new]
    order.order_date   = Date.today.strftime("%Y-%m-%d")
    order.shipping_cost = shipping_cost
    order.order_total   = cart_total + shipping_cost

    if order.save
      save_order_details(cart, order)
      update_shipment(cart, order)
      update_billing_details(cart, order)
      update_payments(cart, order)
      remove_order_session
    end

  end

  def save_order_details(cart, order)
    line_items = LineItem.where(:cart_id => cart.id)

    line_items.each do |item|
      order_detail = OrderDetail.new

      order_detail.order_id = order.id
      order_detail.product_id = item.product_id
      order_detail.quantity = item.quantity
      order_detail.product_price = item.product_price
      order_detail.save
    end
  end

  def update_shipment(cart, order)
    shipment = Shipment.find_by_cart_id(cart.id)
    shipment.order_id = order.id
    shipment.save
  end

  def update_billing_details(cart, order)
    billing_detail = BillingDetail.find_by_cart_id(cart.id)
    billing_detail.order_id = order.id
    billing_detail.save
  end

  def update_payments(cart, order)
    payment = Payment.find_by_cart_id(cart.id)
    payment.order_id = order.id
    payment.save
  end

  def remove_order_session
    session[:cart_id] = nil

    if session[:cart_id].nil? && current_user.present?
      redirect_to dashboard_path
    elsif session[:cart_id].nil?
      redirect_to root_path
    end
  end

  def check_cart_items
    if session[:cart_id].nil?
      redirect_to root_path
    end
  end

  def skip_checkout
    if current_user.present?
      redirect_to shipping_info_path
    end
  end
end

