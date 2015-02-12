class CartsController < ApplicationController
  def cart
    @cart_items = LineItem.where(:cart_id => session[:cart_id])
  end

  def cart_items
    cart = current_cart
    cart_items = cart.cart_items

    respond_to do |format|
      format.json { render json: cart_items, status: :ok }
    end
  end
end
