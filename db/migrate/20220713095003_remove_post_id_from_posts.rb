# frozen_string_literal: true

class RemovePostIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :post_id
  end
end
