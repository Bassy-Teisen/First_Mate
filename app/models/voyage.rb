class Voyage < ApplicationRecord

    has_one_attached :voyage_image

    belongs_to :user

    has_many :applied_voyages, dependent: :destroy
    has_many :appliers, through: :applied_voyages, source: :user
end
