class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def category
    @products = Product.published_products
  end
end
