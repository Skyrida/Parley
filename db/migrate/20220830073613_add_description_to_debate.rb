class AddDescriptionToDebate < ActiveRecord::Migration[7.0]
  def change
    add_column :debates, :description, :text
  end
end
