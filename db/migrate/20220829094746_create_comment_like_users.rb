class CreateCommentLikeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_like_users do |t|
      t.references :argument, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
