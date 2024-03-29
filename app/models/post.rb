# frozen_string_literal: true

class Post < ApplicationRecord
  self.per_page = 1
  belongs_to :user
  has_many_attached :posts
  has_many :likes

  validates :posts, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'video/mp4'] }


  def liked?(user_id)
    @liked_posts = Like.where(user_id: user_id, post_id: id)
    @liked_posts.length.positive? ? true : false
  end

  def likes
    Like.where(post_id: id).length
  end

  def self.ransackable_attributes(auth_object = nil)
    ["likes", "posts", "posts_attachments","description_cont"]
  end

end
