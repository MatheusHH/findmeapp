class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :ads, dependent: :restrict_with_exception
end
