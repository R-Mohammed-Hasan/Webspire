# frozen_string_literal: true

class FollowRequest < ApplicationRecord
  belongs_to :user, optional: true
end
