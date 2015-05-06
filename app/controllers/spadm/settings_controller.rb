class Spadm::SettingsController < Spadm::BaseController
	def index
		@settings = Setting.find_by(id: '1')
	end
	def edit
		@setting = Setting.find_by(id: params[:id])
	end
	def update
		@setting = Setting.find_by(id: params[:id])
		if @setting.update(setting_params)
			redirect_to spadm_settings_url
		else
			render :edit
		end
	end

	private
	def setting_params
		params.require(:setting).permit(:id, :title, :seo, :keyword)
	end
end