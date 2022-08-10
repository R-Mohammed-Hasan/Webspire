# frozen_string_literal: true

class AddGenderToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :string
  end
end
