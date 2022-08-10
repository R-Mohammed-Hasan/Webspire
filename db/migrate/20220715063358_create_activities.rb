# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.text :activity
      t.bigint :user_id

      t.timestamps
    end
  end
end
