class Reflection < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :debate_chat_score, presence: true, numericality: { in: 1..10, only_integer: true }
end
