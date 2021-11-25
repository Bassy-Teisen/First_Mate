class User < ApplicationRecord
  
  after_create :set_role

  rolify
  
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_one :voyage
  has_many :applied_voyages
  has_many :applied, through: :applied_voyages, source: :voyage


  def set_role
    self.add_role(:user) if self.roles.blank?
  end

  def has_already_applied(id)
    av = self.applied_voyages.find_by(voyage_id: id)
    if av
      return true
    else
      return false
    end
  end
end
