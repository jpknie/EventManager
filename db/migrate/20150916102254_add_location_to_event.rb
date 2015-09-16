class AddLocationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :address, :string
    add_column :events, :homepage, :string
    add_column :events, :phonenumber, :string
  end
end
