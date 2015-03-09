class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @property_sets = @product.property_sets
  end

  def category
    @products = Product.published_products
  end

  def filter_products
    unless params[:subcat_ids].nil?
      @products = Product.published_products.where("sub_category_id IN (?)", params[:subcat_ids]).where('price > ? AND price < ?', params[:min_price].to_f - 1, params[:max_price].to_f + 1)
    else
      @products = Product.published_products.where('price > ? AND price < ?', params[:min_price].to_f - 1, params[:max_price].to_f + 1)
    end
  end

end
