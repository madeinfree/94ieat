class CartsController < ApplicationController
	def checkout
		@products = StoreProduct.where(store_id: params[:id])
		@cart = CartItem.where(cart_id: current_cart.id).order(cart_id: :desc)
	end
end