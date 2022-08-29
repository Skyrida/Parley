class CreateArguments < ActiveRecord::Migration[7.0]
  def change
    create_table :arguments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :debate, null: false, foreign_key: true
      t.boolean :perspective_pro

      t.timestamps
    end
  end
end
