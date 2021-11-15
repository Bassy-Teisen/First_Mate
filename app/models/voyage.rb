class Voyage < ApplicationRecord

    has_one_attached :voyage_image

    belongs_to :user
end
