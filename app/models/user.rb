# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one_attached :story
  has_one_attached :user_profile
  has_many :likes
  has_many :comments
  has_many :chattings

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :user_profile, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }
  validates :story, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }

  def posts
    Post.where(user_id: self.id)
end

  def friends
    friends = Follower.where('user_id = ? or follower_id = ? ', id, id)
    return friends.length > 0 ? friends.map { |friend| id == friend.user_id ? friend.follower_id : friend.user_id } : []
  end

  def friend(user_id)
    friends.each do |friend_id|
      return true if friend_id == user_id
    end
    false
  end

  def self.ransackable_attributes(auth_object = nil)
    ['user_name', 'email', 'name']
  end

end
