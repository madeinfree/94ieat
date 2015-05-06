class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :store_id
      t.string :name
      t.integer :price
      t.integer :hito
      t.integer :qty, default: 0
      
      t.timestamps null: false
    end
  end
end
