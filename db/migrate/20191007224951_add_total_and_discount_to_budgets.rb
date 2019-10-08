class AddTotalAndDiscountToBudgets < ActiveRecord::Migration[5.2]
  def change
  	add_monetize :budgets, :totalprice
  	add_monetize :budgets, :discount
  end
end
