class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @property_sets = @product.property_sets
  end

  def category
    @products = Product.published_products
  end
end
