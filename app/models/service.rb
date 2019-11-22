class Service < ApplicationRecord
	belongs_to :user, counter_cache: :counter_of_services

	has_many :budget_services, dependent: :restrict_with_exception
	has_many :budgets, through: :budget_services

	validates :name, :description, presence: true
	validates :price, presence: true,  numericality: { greater_than: 0 }
	validates :user_id, presence: true

	monetize :price_cents
end
