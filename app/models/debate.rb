class Debate < ApplicationRecord
  belongs_to :user
  has_many :chatrooms

  validates :title, presence: true, uniqueness: true, length: { in: 2..100 }
  validates :description, length: { maximum: 300 }
end
