class AddStatusActiveToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :status_active, :boolean, default: true
  end
end
