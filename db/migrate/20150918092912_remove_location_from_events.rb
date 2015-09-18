class RemoveLocationFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :address, :string
    remove_column :events, :homepage, :string
    remove_column :events, :phonenumber, :string
  end
end
