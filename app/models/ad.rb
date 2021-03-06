class Ad < ApplicationRecord

  has_one_attached :picture

  belongs_to :user, counter_cache: :counter_of_ads
  belongs_to :category

  validates :title, :description, :contact, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.street_changed? || obj.city_changed? || obj.state_changed? || obj.country_changed? }

  after_validation :verify_location, on: [ :create, :update ]

  def address
  	[street, city, state, country].compact.join(', ')
  end

  def verify_location 
  	if self.latitude.blank? || self.longitude.blank?
  	  self.errors.add :base, :verify_location
  	end
  end
end
