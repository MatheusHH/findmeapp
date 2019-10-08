class RemovePricesFromBudgets < ActiveRecord::Migration[5.2]
  def change
    remove_column :budgets, :totalprice, :integer
    remove_column :budgets, :discount, :integer
  end
end
