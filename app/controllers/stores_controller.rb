class StoresController < ApplicationController
	before_action :map
	before_action :required_store!, only: [:show]
	before_action :del_cart, only: [:show]
		
	def index
		@stores = Store.order(status: :desc).paginate(:page => params[:page], :per_page => 4)
		@cart = CartItem.where(cart_id: current_cart.id).order(cart_id: :desc)
	end
	def new
		@store = Store.new
	end
	def create
		@store = Store.new(store_params)
		if @store.save
			redirect_to stores_url	
		else
			render :new
		end
	end

	def show
		session[:sid] = params[:id]

		@store = Store.find_by(id: params[:id])
		unless @store.present?
			flash[:notice] = "查無該筆資料"
			redirect_to stores_url
		end
		@products = @store.products.where(store_id: params[:id])

		@cart = Cart.find_by(id: current_cart.id)
		#這台車的所有商品
		@cis = @cart.cart_items
	end


	private
	def store_params
		params.require(:store).permit(:name, :st_type, :pd_type, :address, :tel, :desc)
	end

end

  
  
  