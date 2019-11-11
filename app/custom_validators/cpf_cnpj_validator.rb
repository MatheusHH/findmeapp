class CpfCnpjValidator < ActiveModel::Validator
  require 'br_documents'

  def validate(record)
    if record.cpf.length == 11
      unless BRDocuments::CPF.valid?(record.cpf) 
      	record.errors.add :base, :invalid_cpf
      end
    else
      if record.cpf.length == 13
        unless BRDocuments::CPF.valid?(record.cpf)
    	   record.errors.add :base, :invalid_cnpj
        end
  	  end
    end
  end
end
