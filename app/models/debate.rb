class Debate < ApplicationRecord
  belongs_to :user
  has_many :chatrooms
  has_many :arguments


  validates :title, presence: true, uniqueness: true, length: { in: 2..100 }
  validates :description, length: { maximum: 300 }
  acts_as_taggable_on :tags
end
