class Book < ApplicationRecord
  belongs_to :user, counter_cache: :counter_of_books
  belongs_to :customer

  validates_with ScheduleValidator

  validates :description, :status, :customer_id, presence: true
  validates :schedule, presence: true
  validates :user_id, presence: true

  enum status: [ :pending, :processing, :done ]

  def self.search_by_date(initialdate, finaldate)
  	if initialdate.present? && finaldate.present?
  		where("schedule BETWEEN ? AND ?", initialdate.to_date.beginning_of_day, finaldate.to_date.end_of_day)
  	elsif finaldate.present?
  		where("schedule <= ?", finaldate.to_date.beginning_of_day)
  	elsif initialdate.present?
  		where("schedule >= ?", initialdate.to_date.beginning_of_day)
  	end
  end

  def self.status_attributes_for_select
    statuses.map do |status, s|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.statuses.#{status}"), status]
    end
  end
end
