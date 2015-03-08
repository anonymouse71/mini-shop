class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @property_sets = @product.property_sets
  end

  def category
    @products = Product.published_products
  end

  def filter_products
    @products = Product.published_products.where("sub_category_id IN (?)", params[:subcat_ids])
  end

end
