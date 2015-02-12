class BillingDetailsController < InheritedResources::Base
  def save_billing_address
    billing_address = billing_params
    billing_address['country'] = 'Bangladesh'
    billing_address['cart_id'] = session[:cart_id]

    billing = BillingDetail.find_by_cart_id(session[:cart_id])

    if billing_address.present? && billing.present?
      billing.update_attributes(billing_address)
    else
      BillingDetail.create(billing_address)
    end

    redirect_to shipping_method_path, :notice => 'Billing Address Saved Successfully!'
  end

  def update
    save_billing_address
  end

  def create
    save_billing_address
  end

  private

  def billing_params
    params.require(:billing_detail).permit(:first_name, :last_name, :email, :address, :city, :state, :zip_code, :country,
                                     :mobile_phone, :additional_information, :cart_id)
  end
end
