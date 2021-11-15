class User < ApplicationRecord
  
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_one :voyage
  has_many :applied_voyages
  has_many :applied, through: :applied_voyages, source: :voyage

end
