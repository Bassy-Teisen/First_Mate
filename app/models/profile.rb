class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :boat, dependent: :destroy
  belongs_to :user, class_name: "user", foreign_key: "user_id"
    # validates :name, presence: true 
end
