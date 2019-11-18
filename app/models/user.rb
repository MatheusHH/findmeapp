class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  #:registerable
  enum role: [ :admin, :customer ]

  has_many :ads, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :budgets, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :campaigns, dependent: :destroy
end
