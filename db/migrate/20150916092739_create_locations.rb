class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :address
      t.string :homepage
      t.string :phone

      t.timestamps
    end
  end
end
