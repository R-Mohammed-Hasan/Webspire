class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :posts
  has_many :likes

  def liked?(user_id)
    @liked_posts = Like.where(user_id: user_id,post_id: self.id)
    @liked_posts.length > 0 ? true : false
  end

  def likes
      Like.where(post_id: self.id).length
  end
end
