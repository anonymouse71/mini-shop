class ShipmentsController < ApplicationController

  def save_shipping_address
    shipment_address = shipment_params
    shipment_address['country'] = 'Bangladesh'
    shipment_address['cart_id'] = session[:cart_id]

    shipment = Shipment.find_by_cart_id(session[:cart_id])

    if shipment_address.present? && shipment.present?
      shipment.update_attributes(shipment_address)
    else
      Shipment.create(shipment_address)
    end

    redirect_to billing_info_path, :notice => 'Shipping Address Saved Successfully!'
  end

  def update
    save_shipping_address
  end

  def create
    save_shipping_address
  end

  private

  def shipment_params
    params.require(:shipment).permit(:first_name, :last_name, :email, :address, :city, :state, :zip_code, :country,
                                     :mobile_phone, :additional_information, :cart_id)
  end
end

