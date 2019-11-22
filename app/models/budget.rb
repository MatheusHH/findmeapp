class Budget < ApplicationRecord
  belongs_to :customer
  belongs_to :user, counter_cache: :counter_of_budgets
  
  has_many :budget_services, dependent: :destroy
  has_many :services, through: :budget_services

  validates :customer_id, :duedate, presence: true
  validates :totalprice, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0 }
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

      if self.discount <= total
        total -= self.discount
      else
        total = 0
      end

    	self.totalprice = total
    end
end
