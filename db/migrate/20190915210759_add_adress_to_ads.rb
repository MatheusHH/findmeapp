class AddAdressToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :street, :string
    add_column :ads, :city, :string
    add_column :ads, :state, :string
    add_column :ads, :country, :string
  end
end
