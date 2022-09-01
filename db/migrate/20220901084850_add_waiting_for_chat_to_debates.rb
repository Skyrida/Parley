class AddWaitingForChatToDebates < ActiveRecord::Migration[7.0]
  def change
    add_column :debates, :waiting_for_chat, :string, default:""
  end
end
