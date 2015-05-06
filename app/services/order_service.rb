class OrderService
  def initialize(cart,order)
    @order = order
    @cart = cart
  end
  def place_order_item!
    @cart.cart_items.each do |cart_item|
    # 把cart_item丟給order_item
      item = @order.items.build
      item.product_name = cart_item.product.name
      item.qty = cart_item.qty
      item.price = cart_item.product.price
      item.save
    #清除cart
      @cart.clear!
    end
  end
end