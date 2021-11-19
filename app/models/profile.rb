class Profile < ApplicationRecord

  after_destroy :voyage_destroy
  after_destroy :applied_voyages_destroy

  has_one :boat, dependent: :destroy
  belongs_to :user

  has_one_attached :profile_image
  
  validates :name, presence: {message: "Need to add a Name"}
  validates :phone_number, presence: {message: "Need to add a Phone Number"}
  validates :description, presence: {message: "Need to add a Description"}

  # this is high level talk about this and what it does in relation to the model
  def voyage_destroy
    if self.user.voyage.present?
      self.user.voyage.delete
    end
  end
  
  def applied_voyages_destroy
    if self.user.applied_voyages.present?
      AppliedVoyage.destroy_by(user_id: Profile.last.user_id)
    end
  end
end
