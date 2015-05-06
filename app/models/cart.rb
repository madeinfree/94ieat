class Cart < ActiveRecord::Base
	# belongs_to :order, class_name: "Order", foreign_key: "order_id"
	belongs_to :order
  has_many :cart_items, :dependent => :destroy
  
	def total_price
		cart_items.inject(0) {|sum, item| sum + (item.product.price * item.qty) }
  end
  def clear!
    cart_items.delete_all
  end
end