class User < ApplicationRecord
  has_secure_password
  has_one_attached :user_profile
  has_one_attached :story
  has_many :likes
  has_many :comments

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :mobile_number, presence: true, uniqueness: true


  def posts
    posts = Post.where(user_id: self.id)
    posts
  end

  def friends
    friends = Follower.where("user_id = ? or follower_id = ? ", self.id, self.id)
  end

  def friend(user_id)
    if friends.length > 0
     friends.each do |friend|
        if  friend.user_id == user_id or friend.follower_id == user_id
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

end
