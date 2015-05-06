class CreateOrderInfos < ActiveRecord::Migration
  def change
    create_table :order_infos do |t|
      t.string :shipping_name
      t.string :string
      t.string :shipping_address
      t.string :lineid
      t.string :company

      t.timestamps null: false
    end
  end
end
