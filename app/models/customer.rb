class Customer < ApplicationRecord
  belongs_to :user, counter_cache: true

  has_many :phones, dependent: :destroy
  has_many :books, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :budgets, dependent: :destroy
  has_many :campaign_customer, dependent: :destroy
  has_many :campaigns, through: :campaign_customer

  validates_with CpfCnpjValidator

  validates :name, :cpf, presence: true
  validates :cpf, length: { in: 11..14 }
  validates :user_id, presence: true
  validates_associated :address

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
end
