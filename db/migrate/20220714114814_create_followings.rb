class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.bigint :user_id
      t.bigint :following_id

      t.timestamps
    end
  end
end
