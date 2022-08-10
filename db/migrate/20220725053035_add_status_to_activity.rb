# frozen_string_literal: true

class AddStatusToActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :status, :string
  end
end
