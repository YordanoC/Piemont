class Review < ApplicationRecord
  belongs_to :recette
  belongs_to :user
  validates :content, length: { minimum: 1 }
end
