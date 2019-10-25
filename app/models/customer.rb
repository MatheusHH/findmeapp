class Customer < ApplicationRecord
  belongs_to :user
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :name, :cpf, presence: :true
  validates :user_id, presence: true

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
end
