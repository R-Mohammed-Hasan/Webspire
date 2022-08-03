class User < ApplicationRecord
  has_secure_password
  has_one_attached :user_profile
  has_one_attached :story do |attachable|
    attachable.variant :content_type => "jpg/png"
  end
  has_many :likes
  has_many :comments
  has_many :chattings

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :mobile_number, presence: true, uniqueness: true


  def posts
    posts = Post.where(user_id: self.id)
    posts
  end

  def friends
    friends = Follower.where("user_id = ? or follower_id = ? ", self.id, self.id)
    friends.map {|friend| self.id == friend.user_id ? friend.follower_id : friend.user_id  }
  end

  def friend(user_id)
    self.friends.each do |friend_id|
          if  friend_id == user_id
            return true
          end
      end
      return false
  end

end
