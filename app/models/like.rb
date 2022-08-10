# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post

  def likes_of_post
    likes = Post.where(params[:id])
  end
end
