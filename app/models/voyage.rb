class Voyage < ApplicationRecord

    # Voyage can attach an image which is stored in the cloudinary data base
    has_one_attached :voyage_image

    # Belongs to the User model when the user is destroyed a delete request for this model will be actioned
    belongs_to :user

    # This is for the join table AppliedVoyage with the source being the user model
    # This will perform a delete request which will delete the record of the appliers to the voyage
    has_many :applied_voyages, dependent: :destroy
    has_many :appliers, through: :applied_voyages, source: :user

    # The validation of data entered
    validates :description, presence: {message: "Need to add a Description"}
    validates :voyage, presence: {message: "Need to add a Date"}
    validates :launch, presence: {message: "Need to add a Time"}
end
