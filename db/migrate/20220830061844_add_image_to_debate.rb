class AddImageToDebate < ActiveRecord::Migration[7.0]
  def change
    add_column :debates, :image, :string
  end
end
