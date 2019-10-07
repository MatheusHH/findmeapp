class AddPriceCentsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :price_cents, :integer
  end
end
