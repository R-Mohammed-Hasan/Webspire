class User < ApplicationRecord
  has_secure_password
  has_one_attached :user_profile
  has_one_attached :story

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :mobile_number, presence: true

  def following

  end
  def followers

  end
end
