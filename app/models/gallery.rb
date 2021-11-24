class Gallery < ApplicationRecord

    belongs_to :user

    has_one_attached :voyage_image

    has_many :gallery_reviews, dependent: :destroy
    has_many :reviewee, through: :gallery_reviews, source: :user

    # has_many :applied_voyages, dependent: :destroy
    # has_many :appliers, through: :applied_voyages, source: :user
end
