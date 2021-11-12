class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :boat, dependent: :destroy
  belongs_to :user
  
    validates :name, presence: {message: "Need to add a Name"}
    validates :phone_number, presence: {message: "Need to add a Phone Number"}
    validates :captain, presence: {message: "Need to add a Captian True"}
    validates :description, presence: {message: "Need to add a Description"}
end
