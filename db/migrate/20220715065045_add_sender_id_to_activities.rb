class AddSenderIdToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :sender_id, :bigint
  end

end
