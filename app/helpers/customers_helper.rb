module CustomersHelper
  def cities
  	cities = CS.cities(:rj, :br)
  	cities
  end

  def state 
  	state = ['Rio de Janeiro']
  	state
  end
end
