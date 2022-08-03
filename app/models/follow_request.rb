class FollowRequest < ApplicationRecord
  belongs_to :user, optional: true
end
