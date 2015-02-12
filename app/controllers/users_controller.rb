class UsersController < ApplicationController
  before_filter :authenticate_user!

  def info
    @user = current_user
  end

  def account_settings
    @user = current_user

    if @user.update_attributes(user_params)
      redirect_to user_info_path
    end
  end

  def order_list
    @order_list = Order.user_order_list(current_user.id)
  end

  def order_details
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(:order_id => params[:id])
  end

  def dashboard
  end

  def manage_address
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :date_of_birth)
  end
end
