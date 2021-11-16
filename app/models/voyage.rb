class Voyage < ApplicationRecord
    # this makes adding scope to role, only admin for voyage
    resourcify
    
    has_one_attached :voyage_image

    belongs_to :user

    has_many :applied_voyages, dependent: :destroy
    has_many :appliers, through: :applied_voyages, source: :user
end
