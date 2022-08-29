class CreateCommentSwipeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_swipe_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :argument, null: false, foreign_key: true
      t.boolean :argument_agree

      t.timestamps
    end
  end
end
