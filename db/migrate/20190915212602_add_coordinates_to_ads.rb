class AddCoordinatesToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :latitude, :float
    add_column :ads, :longitude, :float
  end
end
