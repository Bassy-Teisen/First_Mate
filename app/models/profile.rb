class Profile < ApplicationRecord
  
  after_create :set_role
  
  has_one :boat, dependent: :destroy
  belongs_to :user

  has_one_attached :profile_image
  
    validates :name, presence: {message: "Need to add a Name"}
    validates :phone_number, presence: {message: "Need to add a Phone Number"}
    validates :description, presence: {message: "Need to add a Description"}

    def set_role
      self.add_role(:admin) if self.roles.blank?
    end
end
