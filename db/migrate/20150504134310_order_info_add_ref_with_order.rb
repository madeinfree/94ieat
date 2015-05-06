class OrderInfoAddRefWithOrder < ActiveRecord::Migration
  def self.up
  	add_reference :order_infos, :order, index: true, foreign_key: true
  end
  def self.down
  	remove_reference :order_infos, :order, index: true, foreign_key: true
  end
end
