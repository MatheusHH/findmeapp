class Book < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  enum status: [ :pending, :processing, :done ]
end
