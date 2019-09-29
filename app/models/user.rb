class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  #:registerable
  enum role: [ :admin, :customer ]

  has_many :ads
  has_many :customers
end
