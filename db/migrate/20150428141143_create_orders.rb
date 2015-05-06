class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
			t.string :user_id
	    t.integer  :total,	default: 0
  	  t.boolean  :paid,	default: false
			t.string   :payment_method

      t.timestamps null: false
    end
  end
end
