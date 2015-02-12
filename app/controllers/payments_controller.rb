class PaymentsController < ApplicationController

  def save_payment_info
    payment_info = payment_params
    payment_info['cart_id'] = session[:cart_id]

    payment = Payment.find_by_cart_id(session[:cart_id])

    if payment_info.present? && payment.present?
      payment.update_attributes(payment_info)
    else
      Payment.create(payment_info)
    end

    redirect_to review_order_path, :notice => 'Payment info Saved Successfully!'
  end

  def update
    save_payment_info
  end

  def create
    save_payment_info
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :status, :transaction_number, :cart_id, :transaction_mobile_number)
  end
end

