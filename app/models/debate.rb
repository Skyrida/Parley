class Debate < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :chatrooms
  has_many :arguments
  has_many :users, through: :arguments

  validates :title, presence: true, uniqueness: true, length: { in: 2..101 }
  validates :description, length: { maximum: 201 }
  acts_as_taggable_on :tags

  pg_search_scope :search_by_title_and_taglist,
  against: [ :title ],
  using: {
    tsearch: { prefix: true, any_word: true }
  }
end
