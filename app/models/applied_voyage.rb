class AppliedVoyage < ApplicationRecord
  belongs_to :user
  belongs_to :voyage
end
