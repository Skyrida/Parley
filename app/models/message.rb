class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :comment, presence: true, length: { minimum: 1 }
end
