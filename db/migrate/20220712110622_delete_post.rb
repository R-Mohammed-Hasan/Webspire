# frozen_string_literal: true

class DeletePost < ActiveRecord::Migration[6.1]
  def change
    drop_table :posts
  end
end
