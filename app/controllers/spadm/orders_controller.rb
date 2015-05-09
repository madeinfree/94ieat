class Spadm::OrdersController < Spadm::BaseController

  skip_before_filter :verify_authenticity_token, :only => :update

  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
    respond_to do |format|
      format.js { @order }
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    @order.save
    render :json => @order
  end

  def order_status_params
    params.permit(:payment_method)
  end

end