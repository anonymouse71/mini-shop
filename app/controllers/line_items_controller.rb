class LineItemsController < InheritedResources::Base
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.json { render json: @line_item, status: :created  }
      else
        format.json { render json: { status: :unprocessable_entity } }
      end
    end
  end

  def destroy
    cart = current_cart
    id = params[:id]
    line_item = LineItem.where('id = ? AND cart_id = ?', id, cart.id)

    respond_to do |format|
      if line_item.present? && line_item.delete_all
        format.json { render json: {} }
      else
        format.json { render json: { status: :unprocessable_entity } }
      end
    end
  end
end
