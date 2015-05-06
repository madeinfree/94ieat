class Spadm::ProductsController < Spadm::BaseController
	def new
		#show所有商品
		@products = Product.where(store_id: session[:sid])
		#ORM用
		@store = Store.find(session[:sid])
		@product = @store.products.build()
	end
	def create
		#ORM用
		@store = Store.find(session[:sid])
 		@product = @store.products.new(product_params)
		if @product.save
			flash[:notice] = "#{@product.name}Save"
			redirect_to new_spadm_product_ur	l
		else
			render :new
		end
	end
	
	private
	def product_params
		params.require(:product).permit(:name, :price, :qty)
	end
end