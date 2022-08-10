# frozen_string_literal: true

class CreateFollowRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_requests do |t|
      t.bigint :sender_id
      t.bigint :receiver_id
      t.column :status, "ENUM('requested','accepted','rejected')"

      t.timestamps
    end
  end
end
