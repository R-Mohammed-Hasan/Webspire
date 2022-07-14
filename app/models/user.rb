class User < ApplicationRecord
  has_secure_password
  has_one_attached :user_profile
  has_one_attached :story

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :mobile_number, presence: true

  def followings
   followings = Following.where(user_id: @current_user.id)
   followings
  end

  def followers
    followers = Follower.where(user_id: self.id)
    followers
  end

  def follower(user_id)
    followers.include? user_id
  end

  def following(user_id)
    followings.include? user_id
  end

end
