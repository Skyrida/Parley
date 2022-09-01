class AddLookingForChatroomToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :looking_for_chatroom, :boolean, default: false
  end
end
