class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :followed_id #フォローされるユーザーのID
      t.integer :follower_id #フォローするユーザーのID

      t.timestamps
    end
  end
end
