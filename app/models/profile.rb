class Profile < ApplicationRecord
    has_one :boat, dependent: :destroy
end
