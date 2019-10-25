class Budget < ApplicationRecord
  belongs_to :customer
  has_many :budget_services
  has_many :services, through: :budget_services
  belongs_to :user

  validates :customer_id, :duedate, presence: true
  validates :totalprice, presence: true, numericality: true
  validates :user_id, presence: true
  validates_associated :budget_services

  before_save :set_total_price, on: [ :create, :update ]

  monetize :totalprice_cents
  monetize :discount_cents

  accepts_nested_attributes_for :budget_services, reject_if: :all_blank, allow_destroy: true

  private
    def set_total_price
    	total = 0
    	self.budget_services.each do |budget_service|
    	  total += budget_service.service.price
    	end
    	self.totalprice = total
    end
end
