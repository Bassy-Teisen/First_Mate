class AppliedVoyage < ApplicationRecord
  
  # This states that the model belongs to both the user and voyage, this is necessary for it to be a join table
  # when a user applies to a voyage their record is posted to the AppliedVoyage model table in the data base
  belongs_to :user
  belongs_to :voyage
end
