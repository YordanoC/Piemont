class Recette < ApplicationRecord
  has_many :reviews, dependent: :destroy
     mount_uploader :photo, PhotoUploader
     mount_uploader :photo_2, PhotoUploader
end
