# frozen_string_literal: true

class Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :post_id, null: false
      t.bigint :user_id, null: false
      t.text :description
    end
  end
end
