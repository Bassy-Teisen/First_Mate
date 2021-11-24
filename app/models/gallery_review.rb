class GalleryReview < ApplicationRecord
  belongs_to :person_who_reviewed, class: 'User', foreign_key: :reviewer_id
  belongs_to :reviewee, class: 'User'
end
