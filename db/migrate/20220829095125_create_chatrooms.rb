class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.references :debate, null: false, foreign_key: true
      t.references :user_for, null: false, foreign_key: { to_table: :users }
      t.references :user_against, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
