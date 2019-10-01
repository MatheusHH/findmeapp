class AddContactToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :contact, :string
  end
end
