# frozen_string_literal: true

class AddDescriptionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :description, :text
  end
end
