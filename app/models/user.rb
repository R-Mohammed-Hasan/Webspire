class User < ApplicationRecord
  has_secure_password
  has_one_attached :user_profile
  has_one_attached :story
  has_many_attached :posts

  validates :user_name, presence: true
  validates :email, presence: true
  validates :mobile_number, presence: true

  def following

  end
  def followers

  end
end
