class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :product_name
      t.float :price
      t.integer :qty

      t.timestamps null: false
    end
  end
end
