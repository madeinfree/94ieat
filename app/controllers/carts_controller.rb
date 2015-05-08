class CartsController < ApplicationController
# 結帳流程說明 [checkout]: show & edit cart_item & Build shipping_info
	before_action :login_required
  respond_to :js, :html
	# get cart/checkout
	def checkout
		#確認這台車的所有商品
		@ci = current_cart.cart_items
		#輸入訂購人資訊
		@order = current_user.orders.build
		@info = @order.order_infos.build
	end

  def delete_one
    @cart = Cart.find_by(id: current_cart.id)
    @product = Product.find(params[:product_id])
    @cis = @cart.cart_items

    @ci = @cis.find_by(product_id: params[:product_id])
    if @ci.present?
      @ci.qty = @ci.qty - 1
      if @ci.qty == 0
        @ci.destroy
      else
        @ci.update_attributes(product: @product)
      end
    else
      @ci = @cart.cart_items.build(product: @product)
      @ci.save
    end
  end

  def destroy_carts
    @cart = Cart.find_by(id: current_cart.id)
    @product = Product.find(params[:product_id])
    @cis = @cart.cart_items
    @cis.destroy
  end

end