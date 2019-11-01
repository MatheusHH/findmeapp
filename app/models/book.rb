class Book < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  validates :description, :schedule, :status, :customer_id, presence: true
  validates :user_id, presence: true

  enum status: [ :pending, :processing, :done ]

  def self.search_by_date(initialdate, finaldate)
  	where("schedule BETWEEN ? AND ?", initialdate.to_date.beginning_of_day, finaldate.to_date.end_of_day)
  end
end
