class Product < ActiveRecord::Base
	belongs_to :store
	has_many :cart_items
end
