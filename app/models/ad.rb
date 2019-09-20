class Ad < ApplicationRecord
  belongs_to :user


  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.street_changed? || obj.city_changed? || obj.state_changed? || obj.country_changed? }

  def address
  	[street, city, state, country].compact.join(', ')
  end
end
