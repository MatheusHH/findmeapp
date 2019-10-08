class BudgetService < ApplicationRecord
  belongs_to :budget
  belongs_to :service
end
