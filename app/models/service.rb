class Service < ApplicationRecord
	belongs_to :user
	has_many :budgets, through: :budget_services

	monetize :price_cents
end
