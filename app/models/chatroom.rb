class Chatroom < ApplicationRecord
  belongs_to :debate
  belongs_to :user_for, class_name: 'User', foreign_key: 'user_for'
  belongs_to :user_against, class_name: 'User', foreign_key: 'user_against'

  validates :user_for_id, uniqueness: { scope: :user_against_id }
end
