class Address < ApplicationRecord
  belongs_to :customer

  validates :cep, :street, :neighborhood, :city, :state, :customer_id, :email, presence: :true
end
