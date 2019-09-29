class Customer < ApplicationRecord
  belongs_to :user
  has_many :phones
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
