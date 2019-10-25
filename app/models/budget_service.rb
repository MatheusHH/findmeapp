class BudgetService < ApplicationRecord
  belongs_to :budget
  belongs_to :service

  validates :budget_id, :service_id, presence: :true
end
