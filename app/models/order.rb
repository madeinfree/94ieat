class Order < ActiveRecord::Base
	belongs_to :user
	has_many :carts
	has_many :items, :class_name => "OrderItem", :dependent => :destroy
	
	has_many :order_infos
	accepts_nested_attributes_for :order_infos, :allow_destroy => true
end
