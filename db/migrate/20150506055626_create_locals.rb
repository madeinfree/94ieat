class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :desc
      t.string :title

      t.timestamps null: false
    end
  end
end
