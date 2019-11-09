class Address < ApplicationRecord
  belongs_to :customer

  validates :cep, :street, :neighborhood, :city, :state, presence: true 
  validates :email, presence: true, format: Devise.email_regexp
end
