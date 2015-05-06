class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :title
      t.text :gacode
      t.text :seo
      t.string :keyword

      t.timestamps null: false
    end
  end
end
