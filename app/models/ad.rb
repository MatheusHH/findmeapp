class Ad < ApplicationRecord
  belongs_to :user


  geocoded_by :address
  after_validation :geocode

  def address
  	[street, city, state, country].compact.join(', ')
  end
end
