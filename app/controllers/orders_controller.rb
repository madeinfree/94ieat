class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user)
  end

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

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

	private
  def order_params
    params.require(:order).permit(:total,:order_infos_attributes =>
       [:shipping_name, :shipping_address, :lineid, :company] )
  end

end