class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :comment, presence: true, length: { minimum: 1 }

  def sender?(a_user)
    user.id == a_user.id
    # Is this user.id or user_id (as per our data brick)
  end
end
