class Voyage < ApplicationRecord
    
    has_one_attached :voyage_image

    belongs_to :user

    has_many :applied_voyages, dependent: :destroy
    has_many :appliers, through: :applied_voyages, source: :user

    validates :description, presence: {message: "Need to add a Description"}
    validates :voyage, presence: {message: "Need to add a Date"}
    validates :launch, presence: {message: "Need to add a Time"}


end
