class Service < ApplicationRecord
	belongs_to :user
	has_many :budgets, through: :budget_services

	validates :name, :description, :price, presence: :true
	validates :user_id, presence: :true

	monetize :price_cents
end
