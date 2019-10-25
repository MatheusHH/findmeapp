class Budget < ApplicationRecord
  belongs_to :customer
  has_many :budget_services
  has_many :services, through: :budget_services
  belongs_to :user

  validates :customer_id, :duedate, :totalprice, presence: :true
  validates :user_id, presence: true

  monetize :totalprice_cents
  monetize :discount_cents

  accepts_nested_attributes_for :budget_services, reject_if: :all_blank, allow_destroy: true
end
