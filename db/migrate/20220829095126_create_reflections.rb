class CreateReflections < ActiveRecord::Migration[7.0]
  def change
    create_table :reflections do |t|
      t.integer :debate_chat_score
      t.text :conclusion
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
