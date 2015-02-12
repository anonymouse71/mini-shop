class PagesController < ApplicationController
  def index
  end

  def home
    @products = Product.published_products
    @sliders = HomeSlider.all.order('priority')
  end

  def about
  end

  def contact
  end
end
