class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :status, default: 0
      t.string :name
      t.string :st_type
      t.string :shipping_type, default: 0
      t.string :address
      t.string :tel
      t.text :desc
      t.integer :max_qty, default: 0

      t.timestamps null: false
    end
  end
end
