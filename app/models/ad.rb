class Ad < ApplicationRecord
  belongs_to :user

  validates :title, :description, :contact, presence: true
  validates :user_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.street_changed? || obj.city_changed? || obj.state_changed? || obj.country_changed? }

  after_validation :verify_location, on: [ :create, :update ]

  def address
  	[street, city, state, country].compact.join(', ')
  end

  def verify_location 
  	if self.latitude.blank? || self.longitude.blank?
  	  self.errors.add(:ad, "Address is not valid !")
  	end
  end
end
