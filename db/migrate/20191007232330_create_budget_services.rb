class CreateBudgetServices < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_services do |t|
      t.references :budget, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
