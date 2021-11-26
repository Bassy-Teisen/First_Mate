class Profile < ApplicationRecord

  # This is responsible for destroying the users voyage and appliedvoyages because they are not childer of profile they must be destroyed in the after_destroy action
  after_destroy :voyage_destroy
  after_destroy :applied_voyages_destroy

  # A profile can have a boat and it will be destroyed if the profile is destroyed
  # This will perform a delete request in the boat controller when dependent: :destroy is actioned
  has_one :boat, dependent: :destroy

  # Profile is a child of the User model when the user is destroyed a delete request for this model will be actioned
  belongs_to :user

  # A profile can have an image atached which is stored in the cloudinary data base
  has_one_attached :profile_image
  
  # This is the validation for the input data
  validates :name, presence: {message: "Need to add a Name"}
  validates :phone_number, presence: {message: "Need to add a Phone Number"}
  validates :description, presence: {message: "Need to add a Description"}

  # This is refers to the after destroy action and is responsible for finding the profile's voyage and destroying it
  def voyage_destroy
    if self.user.voyage.present?
      self.user.voyage.delete
    end
  end
  
  # This is refers to the after destroy action and is responsible for finding the profile's appliedvoyages and destroying them
  def applied_voyages_destroy
    if self.user.applied_voyages.present?
      AppliedVoyage.destroy_by(user_id: Profile.last.user_id)
    end
  end
end
