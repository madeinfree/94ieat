class Spadm::OrdersController < Spadm::BaseController

  def index
    @orders = Order.all
  end

  def edit
    
  end

end