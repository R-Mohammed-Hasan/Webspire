class AlterTableChattings < ActiveRecord::Migration[6.1]
  def change
    rename_column :chattings, :receiver_id, :room_id

  end
end
