class OrdersController < ApplicationController
	def create
		@order = current_user.orders.build(order_params)
    if @order.save
			OrderService.new(current_cart, @order).place_order_item!
			# 修改倒回顯示該筆訂單明細.
			redirect_to order_path(@order)
		else
			render 'carts/checkout'
		end
	end
	def show
		@order = current_user.orders.find_by(id: params[:id])
		@oi = @order.items
	end
	private
  def order_params
    params.require(:order).permit(:total,:order_infos_attributes =>
       [:shipping_name, :shipping_address, :lineid, :company] )
  end
end