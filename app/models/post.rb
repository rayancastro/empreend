class Post < ApplicationRecord
  belongs_to :user

  mount_uploader :primary_photo, PhotoUploader
end
