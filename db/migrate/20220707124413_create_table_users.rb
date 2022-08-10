# frozen_string_literal: true

class CreateTableUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :user_name

      t.text :email

      t.integer :mobile_number

      t.string :password_digest

      t.timestamps
    end
  end
end
