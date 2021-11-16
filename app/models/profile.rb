class Profile < ApplicationRecord

  
  has_one :boat, dependent: :destroy
  belongs_to :user

  has_one_attached :profile_image
  
  validates :name, presence: {message: "Need to add a Name"}
  validates :phone_number, presence: {message: "Need to add a Phone Number"}
  validates :description, presence: {message: "Need to add a Description"}

   
end
