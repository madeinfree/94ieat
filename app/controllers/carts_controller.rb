class CartsController < ApplicationController
# 結帳流程說明 [checkout]: show & edit cart_item & Build shipping_info
	before_action :login_required
	# get cart/checkout
	def checkout
		#確認這台車的所有商品
		@ci = current_cart.cart_items
		#輸入訂購人資訊
		@order = current_user.orders.build
		@info = @order.order_infos.build
	end
end