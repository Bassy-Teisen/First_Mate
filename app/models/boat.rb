class Boat < ApplicationRecord
    belongs_to :profile

    has_one_attached :boat_image

    validates :category, presence: {message: "Need to add a Category"}
    validates :size, presence: {message: "Need to add a Size"}
    validates :capasity, presence: {message: "Need to add a Capasity"}
    validates :activity, presence: {message: "Need to add an activity"}
end
