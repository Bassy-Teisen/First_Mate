class Profile < ApplicationRecord
    has_one :boat, dependent: :destroy

    validates :name, presence: true 
end
