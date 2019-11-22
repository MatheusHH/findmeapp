class AddCountersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :counter_of_books, :integer, default: 0
    add_column :users, :counter_of_services, :integer, default: 0
    add_column :users, :counter_of_ads, :integer, default: 0
    add_column :users, :counter_of_budgets, :integer, default: 0
    add_column :users, :counter_of_campaigns, :integer, default: 0
  end
end
