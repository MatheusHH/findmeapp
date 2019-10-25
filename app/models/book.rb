class Book < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  validates :description, :schedule, :status, :customer_id, presence: :true
  validates :user_id, presence: true

  enum status: [ :pending, :processing, :done ]
end
