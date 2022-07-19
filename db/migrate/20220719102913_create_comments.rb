class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :post_id, references: :user
      t.bigint :user_id, references: :user
      t.text :comment

      t.timestamps
    end
  end
end
