class Spadm::StoresController < Spadm::BaseController
	before_action :map
	before_action :required_store!, only: [:show, :edit, :update]
	def index
		@stores = Store.all
	end
	def new
		@store = Store.new
	end
	def create
		@store = Store.new(store_params)
		@store.status = 1
		if @store.save
			redirect_to spadm_stores_url
		else
			render :new
		end
	end
	def show
		# 商家頁會有新增產品的需求, 所以用一個session去記住現在是哪個商家.
		session[:sid] = @store.id
		@products = StoreProduct.where(store_id: session[:sid])
	end
	def edit
		
	end
	def update
		
	end

	private
	def store_params
		params.require(:store).permit(:name, :st_type, :pd_type, :address, :tel, :desc, :max_qty)
	end
end