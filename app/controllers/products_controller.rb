class ProductsController < ApplicationController
  respond_to :js, :html
  
  def add_to_cart_item
    @cart = Cart.find_by(id: current_cart.id)
    @product = Product.find(params[:id])
  	@cis = @cart.cart_items

    @ci = @cis.find_by(product_id: params[:id])
  	if @ci.present?
  		@ci.qty = @ci.qty + 1
      @ci.update_attributes(product: @product)
  	else
      @ci = @cart.cart_items.build(product: @product)
      @ci.save
  	end
  end	

  def qty_params
    params.require(:qty).permit(:qty)
  end
end