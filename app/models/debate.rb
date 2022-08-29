class Debate < ApplicationRecord
  belongs_to :user
  has_many :chatrooms

  validates :title, presence: true, uniqueness: true, length: { in: 6..100 }
end
