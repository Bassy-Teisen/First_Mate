class User < ApplicationRecord
  
  # Sets the user role for every user once they sign up and log in
  after_create :set_role

  # including the rolify method as part of the gem
  rolify
  
  # this relates to the devise authentication where the user can only do permited actions until logged in
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # States that the user can have one profile and if user is destroyed so will the profile 
  # This will perform a delete request in the profile controller when dependent: :destroy is actioned
  has_one :profile, dependent: :destroy

  # A user can have one voyage that they create and also they can apply to join many voyages, with the source for the many being the voyage model
  has_one :voyage
  has_many :applied_voyages
  has_many :applied, through: :applied_voyages, source: :voyage

  # This is where the user role is set and only if they don't already have one
  def set_role
    self.add_role(:user) if self.roles.blank?
  end

  # This ensures that a user only applies once to a specific voyage
  def has_already_applied(id)
    av = self.applied_voyages.find_by(voyage_id: id)
    if av
      return true
    else
      return false
    end
  end
end
