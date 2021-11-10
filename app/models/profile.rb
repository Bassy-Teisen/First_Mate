class Profile < ApplicationRecord
    has_many :boats, dependent: :destroy
end
