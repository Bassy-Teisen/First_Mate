class Boat < ApplicationRecord

    # A boat is a child of the Profile model when the profile is destroyed a delete request for this model will be actioned
    belongs_to :profile

    # A boat can have a image attached which is stored in the cloudinary data base
    has_one_attached :boat_image

    # This is the validation for the input data
    validates :category, presence: {message: "Need to add a Category"}
    validates :size, presence: {message: "Need to add a Size"}
    validates :capasity, presence: {message: "Need to add a Capasity"}
    validates :activity, presence: {message: "Need to add an activity"}
end
