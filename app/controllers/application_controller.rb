class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = exception.message

    if current_user.present?
      redirect_to root_path
    else
      session[:user_return_to] = request.url
      redirect_to new_user_session_path
    end

  end

  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:is_admin?)
  end

  rescue_from SecurityError do |exception|
    redirect_to root_path
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

end
