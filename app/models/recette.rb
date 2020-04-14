class Recette < ApplicationRecord
     mount_uploader :photo, PhotoUploader
     mount_uploader :photo_2, PhotoUploader
end
