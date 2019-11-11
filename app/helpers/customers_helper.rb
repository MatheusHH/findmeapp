module CustomersHelper
  def cities
  	cities = CS.cities(:rj, :br)
  	cities
  end

  def state 
  	state = ['Rio de Janeiro']
  	state
  end

  def pretty_cpf_cnpj(value)
  	if value.length == 11
  	  value = BRDocuments::CPF.pretty(value)
  	else
  	  if value.length == 14
  	  	value = BRDocuments::CNPJ.pretty(value)
  	  end
  	end
  	value
  end
end
