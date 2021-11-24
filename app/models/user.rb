class User < ApplicationRecord
  
  after_create :set_role

  has_many :reviews_made, class_name: "GalleryReview", foreign_key: :reviewer_id
  has_many :reviews_of, class_name: "GalleryReview", foreign_key: :reviewee_id

  rolify
  
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_one :voyage
  has_many :applied_voyages
  has_many :applied, through: :applied_voyages, source: :voyage

  has_many :gallery_reviews
  has_many :reviewed, through: :gallery_reviews, source: :gallery

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
