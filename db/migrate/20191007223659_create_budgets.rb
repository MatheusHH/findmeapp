class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.references :customer, foreign_key: true
      t.date :duedate
      t.integer :totalprice
      t.integer :discount

      t.timestamps
    end
  end
end
