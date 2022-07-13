class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :posts
  has_many :like
end
