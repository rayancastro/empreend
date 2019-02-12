class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :display_url, presence: true, uniqueness: true

  mount_uploader :primary_photo, PhotoUploader
end
