class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :address
      t.string :homepage
      t.string :phonenumber

      t.timestamps
    end
  end
end
