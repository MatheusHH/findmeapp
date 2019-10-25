class Phone < ApplicationRecord
  belongs_to :customer

  validates :customer_id, :number, presence: true
end
