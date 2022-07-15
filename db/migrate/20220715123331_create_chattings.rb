class CreateChattings < ActiveRecord::Migration[6.1]
  def change
    create_table :chattings do |t|
      t.bigint :sender_id
      t.bigint :receiver_id
      t.text :message

      t.timestamps
    end
  end
end
