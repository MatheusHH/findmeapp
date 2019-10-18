module AdsHelper
  def cities
  	cities = CS.cities(:rj, :br)
  	cities
  end

  def state 
  	state = ['Rio de Janeiro']
  	state
  end

  def country
  	country = ['Brasil']
  	country
  end
end
