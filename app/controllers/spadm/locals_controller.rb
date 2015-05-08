class Spadm::LocalsController < Spadm::BaseController
	def index
#		@locals = Local.all
#    @hash = Gmaps4rails.build_markers(@locals) do |local, marker|
#      marker.lat local.latitude
#      marker.lng local.longitude
#    end
	end
	def new
		@local = Local.new
	end
	def create
		@local = Local.new(local_params)
		if @local.save
			redirect_to spadm_locals_url
		else
			render :new
		end
	end

	private
	def local_params
		params.require(:local).permit(:latitude, :longitude, :address, :desc, :title)
	end
end