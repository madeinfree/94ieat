class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_cart
  before_action :site
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def site
    @setting = Setting.find_by(id: '1')
    @cart = Cart.find_by(id: current_cart.id)
    #這台車的所有商品
    @ci = @cart.cart_items.includes(:product).order(cart_id: :desc)
  end
  def required_store!
    @store = Store.find_by_id(params[:id])
    redirect_to stores_url, notice: '沒有這筆商家存在' unless @store.present?
  end
  def login_required
    if current_user.blank?
      respond_to do |format|
        format.html {
          authenticate_user!
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end
  def map
    @locals = Local.all
    @hash = Gmaps4rails.build_markers(@locals) do |local, marker|
      marker.lat local.latitude
      marker.lng local.longitude
      marker.infowindow local.title
    end
  end
  def current_cart
    @current_cart ||= find_cart
  end
  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    unless cart.present?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    cart
  end  
  def del_cart
    if params[:id] != session[:sid]
      session[:cart_id] = nil
    end
  end  
  
  ## devise增加欄位所以要這樣, 接收新增的欄位.
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :company, :mobile, :email, :password, :password_confirmation) }
  end

end
