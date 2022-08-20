class ChangeMobileNumberInUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :mobile_number, :bigint, :default => "null"
  end
end
