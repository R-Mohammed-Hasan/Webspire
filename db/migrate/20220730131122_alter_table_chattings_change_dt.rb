class AlterTableChattingsChangeDt < ActiveRecord::Migration[6.1]
  def change
    change_column :chattings, :room_id, :string
  end
end
