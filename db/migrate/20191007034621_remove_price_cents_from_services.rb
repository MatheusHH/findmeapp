class RemovePriceCentsFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :price_cents, :string
  end
end
