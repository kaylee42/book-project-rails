class CreateFrienships < ActiveRecord::Migration
  def change
    create_table :frienships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true

      t.timestamps null: false
    end

    add_foreign_key :frienships, :users, column: :friend_id
  end
end
