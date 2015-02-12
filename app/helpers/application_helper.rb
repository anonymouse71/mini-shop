module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def to_bdt(amount)
    number_to_currency(amount, :unit => 'BDT ', :separator => '.', :delimiter => ',')
  end
end
